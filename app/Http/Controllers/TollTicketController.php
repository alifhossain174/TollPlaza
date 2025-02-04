<?php

namespace App\Http\Controllers;

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
use Illuminate\Support\Facades\Auth;

class TollTicketController extends Controller
{
    public function createTollTicket(){
        $vehicleTypes = VehicleType::where('status', 1)->orderBy('serial', 'asc')->get();
        $terminals = Terminal::where('status', 1)->orderBy('name', 'asc')->get();
        return view('backend.toll_ticket.create', compact('vehicleTypes', 'terminals'));
    }

    public function saveTollTicket(Request $request){

        if(Auth::user()->user_type == 1){
            $terminalId = $request->terminal_id;
            $terminalInfo = Terminal::where('id', $terminalId)->first();
        } else {
            $terminalId = Auth::user()->terminal_id;
            $terminalInfo = Terminal::where('id', $terminalId)->first();
        }

        $vehicleTypeInfo = VehicleType::where('id', $request->vehicle_type_id)->first();

        $lastInsertId = TollTicket::insertGetId([
            'ticket_no' => time().str::random(3),
            'terminal_id' => $terminalId,
            'terminal_name' => $terminalInfo ? $terminalInfo->name : null,
            'user_id' => Auth::user()->id,
            'user_name' => Auth::user()->name,
            'vehicle_type_id' => $vehicleTypeInfo->id,
            'vehicle_type_name' => $vehicleTypeInfo->type_name,
            'ticket_price' => $vehicleTypeInfo->price,
            'amount_given' => $vehicleTypeInfo->amount_given,
            'return_change' => $vehicleTypeInfo->return_change,
            'payment_method' => $request->payment_method,
            'driver_name' => $request->driver_name,
            'driver_contact' => $request->driver_contact,
            'vehicle_reg_no' => $request->vehicle_reg_no,
            'slug' => time().str::random(5),
            'status' => 1,
            'created_at' => Carbon::now()
        ]);

        $ticketInfo = TollTicket::where('id', $lastInsertId)->first();
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
                if ($request->user_id != '') {
                    $query->where('user_id', $request->user_id);
                }
                if ($request->payment_method != '') {
                    $query->where('payment_method', $request->payment_method);
                }
                if ($request->driver_name != '') {
                    $query->where('driver_name', 'LIKE', '%' . $request->driver_name . '%');
                }
                if ($request->driver_contact != '') {
                    $query->where('driver_contact', 'LIKE', '%' . $request->driver_contact . '%');
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
                    ->editColumn('driver_name', function($data) {
                        $driverInfo = $data->driver_name;
                        if($data->driver_contact){
                            $driverInfo .= " (".$data->driver_contact.")";
                        }
                        return $driverInfo;
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
        $users = User::get();
        return view('backend.toll_ticket.view', compact('terminals', 'users', 'vehicleTypes'));
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
