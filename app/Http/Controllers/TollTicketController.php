<?php

namespace App\Http\Controllers;

use App\Models\Counter;
use App\Models\CounterSession;
use App\Models\GeneralInfo;
use Carbon\Carbon;
use App\Models\Terminal;
use App\Models\TollTicket;
use App\Models\User;
use Illuminate\Support\Str;
use App\Models\VehicleType;
use DateTime;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class TollTicketController extends Controller
{
    public function createTollTicket(){

        if(CounterSession::where('user_id', Auth::user()->id)->where('counter_status', 0)->exists()){
            $vehicleTypes = VehicleType::where('status', 1)->orderBy('serial', 'asc')->get();
            $counters = DB::table('counters')
                            ->leftJoin('terminals', 'counters.terminal_id', 'terminals.id')
                            ->select('counters.*', 'terminals.name as terminal_name')
                            ->where('counters.status', 1)
                            ->orderBy('counters.name', 'asc')
                            ->get();

            return view('backend.toll_ticket.create', compact('vehicleTypes', 'counters'));
        } else {
            if(Auth::user()->user_type == 1){
                $counters = DB::table('counters')
                ->leftJoin('terminals', 'counters.terminal_id', 'terminals.id')
                ->select('counters.*', 'terminals.name as terminal_name')
                ->where('counters.status', 1)
                ->orderBy('counters.name', 'asc')
                ->get();
            } else {
                $counters = DB::table('counters')
                ->leftJoin('terminals', 'counters.terminal_id', 'terminals.id')
                ->select('counters.*', 'terminals.name as terminal_name')
                ->where('counters.status', 1)
                ->where('counters.id', Auth::user()->counter_id)
                ->orderBy('counters.name', 'asc')
                ->get();
            }

            return view('backend.toll_ticket.counters',compact('counters'));
        }

    }

    public function saveTollTicket(Request $request){

        if(Auth::user()->user_type == 1){
            $counterId = $request->counter_id;
            $counterInfo = Counter::where('id', $counterId)->first();
            $terminalInfo = Terminal::where('id', $counterInfo->terminal_id)->first();
        } else {
            $counterId = Auth::user()->counter_id;
            $counterInfo = Counter::where('id', $counterId)->first();
            $terminalInfo = Terminal::where('id', $counterInfo->terminal_id)->first();
        }

        $vehicleTypeInfo = VehicleType::where('id', $request->vehicle_type_id)->first();


        $datePrefix = Carbon::now()->format('ymd'); // YYMMDD format
        $ticketNo = DB::transaction(function () use ($datePrefix) {
            // Lock the row to prevent other users from reading it simultaneously
            $lastTicket = TollTicket::where('ticket_no', 'like', "{$datePrefix}-%")
                ->lockForUpdate() // Forces other transactions to wait
                ->orderBy('id', 'desc')
                ->first();

            // Determine the next sequence number
            $lastSequence = $lastTicket ? (int)substr($lastTicket->ticket_no, 7) : 0;
            $nextSequence = $lastSequence + 1;

            // Generate the new ticket number
            return "{$datePrefix}-{$nextSequence}";
        });

        // Now insert the new ticket safely with the generated ticket_no
        $ticket = new TollTicket();
        $ticket->ticket_no = $ticketNo;
        $ticket->terminal_id = $terminalInfo ? $terminalInfo->id : null;
        $ticket->terminal_name = $terminalInfo ? $terminalInfo->name : null;
        $ticket->counter_id = $counterInfo ? $counterInfo->id : null;
        $ticket->counter_name = $counterInfo ? $counterInfo->name : null;
        $ticket->user_id = Auth::user()->id;
        $ticket->user_name = Auth::user()->name;
        $ticket->vehicle_type_id = $vehicleTypeInfo->id;
        $ticket->vehicle_type_name = $vehicleTypeInfo->type_name;
        $ticket->ticket_price = $vehicleTypeInfo->price;
        $ticket->amount_given = $vehicleTypeInfo->amount_given;
        $ticket->return_change = $vehicleTypeInfo->return_change;
        $ticket->payment_method = $request->payment_method;
        $ticket->vehicle_reg_no = $request->vehicle_reg_no;
        $ticket->slug = time() . Str::random(5);
        $ticket->status = 1;
        $ticket->created_at = Carbon::now();

        // Save the ticket
        $ticket->save();

        $ticketInfo = TollTicket::where('id', $ticket->id)->first();
        $generalInfo = GeneralInfo::where('id', 1)->first();
        return view('backend.toll_ticket.ticket_print', compact('ticketInfo', 'generalInfo', 'vehicleTypeInfo'));
    }

    public function viewTollTickets(Request $request){
        if ($request->ajax()) {

            if(Auth::user()->user_type == 1){
                $query = TollTicket::orderBy('id', 'desc');

                // Continue with filtering
                if ($request->ticket_no != '') {
                    $query->where('ticket_no', 'LIKE', '%' . $request->ticket_no . '%');
                }
                if ($request->vehicle_type_id != '') {
                    $query->where('vehicle_type_id', $request->vehicle_type_id);
                }
                if ($request->terminal_id != '') {
                    $query->where('terminal_id', $request->terminal_id);
                }
                if ($request->counter_id != '') {
                    $query->where('counter_id', $request->counter_id);
                }
                if ($request->user_id != '') {
                    $query->where('user_id', $request->user_id);
                }
                if ($request->payment_method != '') {
                    $query->where('payment_method', $request->payment_method);
                }
                if ($request->vehicle_reg_no != '') {
                    $query->where('vehicle_reg_no', 'LIKE', '%' . $request->vehicle_reg_no . '%');
                }
                if ($request->purchase_date_range != '') {
                    $dateRange = $request->purchase_date_range;
                    list($startDateStr, $endDateStr) = explode(" - ", $dateRange);
                    $startDate = DateTime::createFromFormat("M j, Y", trim($startDateStr));
                    $endDate = DateTime::createFromFormat("M j, Y", trim($endDateStr));
                    $formattedStartDate = $startDate ? $startDate->format("Y-m-d")." 00:00:00" : null;
                    $formattedEndDate = $endDate ? $endDate->format("Y-m-d"). " 23:59:59" : null;
                    $query->whereBetween('created_at', [$formattedStartDate, $formattedEndDate]);
                }

                $data = $query->get();

            } else {
                $data = TollTicket::where('user_id', Auth::user()->id)->orderBy('id', 'desc')->get();
            }

            return Datatables::of($data)
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d", strtotime($data->created_at))."<br>".date("h:i a", strtotime($data->created_at));
                    })
                    ->editColumn('ticket_price', function($data) {
                        return $data->ticket_price." BDT";
                    })
                    ->editColumn('payment_method', function($data) {
                        if($data->payment_method == 1)
                            return "Cash";
                        elseif($data->payment_method == 2)
                            return "bKash";
                        elseif($data->payment_method == 3)
                            return "nagad";
                        elseif($data->payment_method == 4)
                            return "card";
                        else
                            return "N/A";
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="'.url('print/toll/ticket').'/'.$data->slug.'" class="mb-1 btn-sm btn-info rounded"><i class="fas fa-print"></i></a>';
                        if(Auth::user()->user_type == 1){
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        }
                        return $btn;
                    })
                    ->rawColumns(['action', 'payment_method', 'created_at'])
                    ->make(true);
        }

        $vehicleTypes = VehicleType::orderBy('serial', 'asc')->get();
        $terminals = Terminal::orderBy('name', 'asc')->get();
        $counters = Counter::orderBy('name', 'asc')->get();
        $users = User::get();
        return view('backend.toll_ticket.view', compact('terminals', 'users', 'vehicleTypes', 'counters'));
    }

    public function deleteTollTicket($id){
        TollTicket::where('id', $id)->delete();
        return response()->json(['success' => 'Toll Ticket deleted successfully.']);
    }

    public function printTollTicket($slug){
        $ticketInfo = TollTicket::where('slug', $slug)->first();
        $generalInfo = GeneralInfo::where('id', 1)->first();
        $vehicleTypeInfo = VehicleType::where('id', $ticketInfo->vehicle_type_id)->first();
        return view('backend.toll_ticket.ticket_print', compact('ticketInfo', 'generalInfo', 'vehicleTypeInfo'));
    }
}
