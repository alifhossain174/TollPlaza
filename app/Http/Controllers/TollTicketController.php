<?php

namespace App\Http\Controllers;

use App\Models\GeneralInfo;
use Carbon\Carbon;
use App\Models\Terminal;
use App\Models\TollTicket;
use Illuminate\Support\Str;
use App\Models\VehicleType;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\Auth;

class TollTicketController extends Controller
{
    public function createTollTicket(){
        $vehicleTypes = VehicleType::where('status', 1)->orderBy('id', 'desc')->get();
        $terminals = Terminal::where('status', 1)->orderBy('name', 'asc')->get();
        return view('backend.toll_ticket.create', compact('vehicleTypes', 'terminals'));
    }

    public function saveTollTicket(Request $request){

        if(Auth::user()->user_type == 1){
            $terminalId = $request->terminal_id;
            $terminalInfo = Terminal::where('id', $terminalId)->first();
        } else {
            $terminalId = Auth::user()->terminal__id;
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
                $data = TollTicket::orderBy('id', 'desc')->get();
            } else {
                $data = TollTicket::where('user_id', Auth::user()->id)->orderBy('id', 'desc')->get();
            }

            return Datatables::of($data)
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d h:i:s a", strtotime($data->created_at));
                    })
                    ->editColumn('ticket_price', function($data) {
                        return $data->ticket_price." BDT";
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="'.url('print/toll/ticket').'/'.$data->slug.'" class="mb-1 btn-sm btn-info rounded"><i class="fas fa-print"></i></a>';
                        if(Auth::user()->user_type == 1){
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        }
                        return $btn;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }
        return view('backend.toll_ticket.view');
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
