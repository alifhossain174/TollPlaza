<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Terminal;
use App\Models\TollTicket;
use Illuminate\Support\Str;
use App\Models\VehicleType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Brian2694\Toastr\Facades\Toastr;

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

        TollTicket::insert([
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

        return view('backend.toll_ticket.ticket_print', compact('entry'));
    }
}
