<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TollTicketController extends Controller
{
    public function createTollTicket(){
        return view('backend.toll_ticket.create');
    }
}
