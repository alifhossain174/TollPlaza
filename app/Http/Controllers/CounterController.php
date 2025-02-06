<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Counter;
use App\Models\CounterSession;
use App\Models\Terminal;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Brian2694\Toastr\Facades\Toastr;
use DateTime;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CounterController extends Controller
{
    public function createCounter(){
        $terminals = Terminal::where('status', 1)->orderBy('name', 'asc')->get();
        return view('backend.counter.create', compact('terminals'));
    }

    public function saveCounter(Request $request){

        Counter::insert([
            'terminal_id' => $request->terminal_id,
            'name' => $request->name,
            'description' => $request->description,
            'status' => 1,
            'slug' => time().str::random(5),
            'created_at' => Carbon::now()
        ]);

        Toastr::success('New Counter Created', 'Success');
        return back();

    }

    public function viewCounters(Request $request){
        if ($request->ajax()) {

            $data = DB::table('counters')
                    ->leftJoin('terminals', 'counters.terminal_id', 'terminals.id')
                    ->select('counters.*', 'terminals.name as terminal_name')
                    ->orderBy('id', 'desc')
                    ->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return '<span style="color:green; font-weight: 600">Active</span>';
                        } else {
                            return '<span style="color:#DF3554; font-weight: 600">Inactive</span>';
                        }
                    })
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d h:i:s a", strtotime($data->created_at));
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="'.url('edit/counter').'/'.$data->slug.'" class="mb-1 btn-sm btn-warning rounded"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'status'])
                    ->make(true);
        }
        return view('backend.counter.view');
    }

    public function deleteCounter($id){
        Counter::where('id', $id)->delete();
        return response()->json(['success' => 'Counter deleted successfully.']);
    }

    public function editCounter($slug){
        $counterInfo = Counter::where('slug', $slug)->first();
        $terminals = Terminal::where('status', 1)->orderBy('name', 'asc')->get();
        return view('backend.counter.update', compact('counterInfo', 'terminals'));
    }

    public function updateCounter(Request $request){
        Counter::where('id', $request->counter_id)->update([
            'terminal_id' => $request->terminal_id,
            'name' => $request->name,
            'description' => $request->description,
            'status' => $request->status,
            'updated_at' => Carbon::now()
        ]);

        Toastr::success('Counter Updated', 'Success');
        return redirect('/view/counters');
    }

    public function terminalWiseCounter(Request $request){
        $data = Counter::where("terminal_id", $request->terminal_id)->where('status', 1)->select('name', 'id')->get();
        return response()->json($data);
    }

    public function viewCounterSessions(Request $request){
        if ($request->ajax()) {

            if(Auth::user()->user_type == 1)
                $query = CounterSession::orderBy('id', 'desc');
            else
                $query = CounterSession::where('user_id', Auth::user()->id)->orderBy('id', 'desc');

            // Continue with filtering
            if ($request->terminal_id != '') {
                $query->where('terminal_id', $request->terminal_id);
            }
            if ($request->counter_id != '') {
                $query->where('counter_id', $request->counter_id);
            }
            if ($request->user_id != '') {
                $query->where('user_id', $request->user_id);
            }
            if ($request->checkin_date_range != '') {
                $dateRange = $request->checkin_date_range;
                list($startDateStr, $endDateStr) = explode(" - ", $dateRange);
                $startDate = DateTime::createFromFormat("M j, Y", trim($startDateStr));
                $endDate = DateTime::createFromFormat("M j, Y", trim($endDateStr));
                $formattedStartDate = $startDate ? $startDate->format("Y-m-d")." 00:00:00" : null;
                $formattedEndDate = $endDate ? $endDate->format("Y-m-d"). " 23:59:59" : null;
                $query->whereBetween('checkin_time', [$formattedStartDate, $formattedEndDate]);
            }

            $data = $query->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return '<span style="color:green; font-weight: 600">Completed</span>';
                        } else {
                            return '<span style="color:#DF3554; font-weight: 600">Pending</span>';
                        }
                    })
                    ->editColumn('checkin_time', function($data) {
                        if($data->checkin_time)
                        return date("d/m/y h:i a", strtotime($data->checkin_time));
                    })
                    ->editColumn('checkout_time', function($data) {
                        if($data->checkout_time)
                        return date("d/m/y h:i a", strtotime($data->checkout_time));
                    })
                    ->editColumn('opening_balance', function($data) {
                        if($data->opening_balance >= 0)
                        return number_format($data->opening_balance)."/=";
                    })
                    ->editColumn('closing_balance', function($data) {
                        if($data->closing_balance)
                        return number_format($data->closing_balance)."/=";
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = "";
                        if($data->status == 0 && Auth::user()->user_type == 1)
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->slug.'" data-original-title="Complete" class="btn-sm btn-success rounded completeBtn"><i class="fas fa-check"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'status'])
                    ->make(true);
        }

        $terminals = Terminal::orderBy('name', 'asc')->get();
        $users = User::get();
        $counters = Counter::orderBy('name', 'asc')->get();
        return view('backend.counter.sessions', compact('terminals', 'users', 'counters'));
    }

    public function completeCounterSession($slug){
        CounterSession::where('slug', $slug)->update([
            'status' => 1,
            'updated_at' => Carbon::now()
        ]);
        return response()->json(['success' => 'Session Completed successfully.']);
    }

    public function submitCounterCheckin(Request $request){

        $counterInfo = Counter::where('id', $request->checkin_counter_id)->first();
        $terminalInfo = Terminal::where('id', $counterInfo->terminal_id)->first();
        $counterSession = CounterSession::where('counter_id', $counterInfo->id)->orderBy('id', 'desc')->first();

        CounterSession::insert([
            'terminal_id' => $terminalInfo ? $terminalInfo->id : null,
            'terminal_name' => $terminalInfo ? $terminalInfo->name : null,
            'counter_id' => $counterInfo ? $counterInfo->id : null,
            'counter_name' => $counterInfo ? $counterInfo->name : null,
            'user_id' => Auth::user()->id,
            'user_name' => Auth::user()->name,
            'checkin_time' => Carbon::now(),
            'checkout_time' => null,
            'opening_balance' => $counterSession ? $counterSession->closing_balance : 0,
            'balance_missmatch' => $request->balance_missmatch,
            'counter_status' => 0, //occupied
            'status' => 0,
            'slug' => time().str::random(5),
            'created_at' => Carbon::now()
        ]);

        return response()->json(['success' => 'Counter Checked In successfully.']);
    }

    public function submitCounterCheckout(Request $request){
        $lastCounterSession = CounterSession::where('user_id', Auth::user()->id)->orderBy('id', 'desc')->first();
        $lastCounterSession->checkout_time = Carbon::now();
        $lastCounterSession->counter_status = 1;
        $lastCounterSession->closing_balance = $request->closing_balance;
        $lastCounterSession->updated_at = Carbon::now();
        $lastCounterSession->save();

        return response()->json(['success' => 'Counter Checked Out successfully.']);
    }
}
