<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Terminal;
use App\Models\TollTicket;
use App\Models\User;
use App\Models\VehicleType;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function tollTicketReport(){
        $terminals = Terminal::orderBy('name', 'asc')->get();
        $users = User::get();
        $vehicleTypes = VehicleType::orderBy('id', 'desc')->get();
        return view('backend.report.toll_ticket_report', compact('terminals', 'users', 'vehicleTypes'));
    }

    public function generateTollTicketReport(Request $request){

        $startDate = date("Y-m-d", strtotime(str_replace("/","-",$request->start_date)))." 00:00:00";
        $endDate = date("Y-m-d", strtotime(str_replace("/","-",$request->end_date)))." 23:59:59";

        $vehicle_type_id = $request->vehicle_type_id;
        $terminal_id = $request->terminal_id;
        $user_id = $request->user_id;

        $query = TollTicket::query();
        $query->whereBetween('created_at', [$startDate, $endDate]);

        if ($vehicle_type_id != '') {
            $query->where('vehicle_type_id', $vehicle_type_id);
        }
        if ($terminal_id != '') {
            $query->where('terminal_id', $terminal_id);
        }
        if ($user_id != '') {
            $query->where('user_id', $user_id);
        }
        $data = $query->orderBy('id', 'desc')->get();

        $returnHTML = view('backend.report.toll_ticket_report_view', compact('startDate', 'endDate', 'data'))->render();
        return response()->json(['variant' => $returnHTML]);

    }
}
