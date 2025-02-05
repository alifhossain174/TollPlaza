<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Counter;
use App\Models\Terminal;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Brian2694\Toastr\Facades\Toastr;
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
}
