<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TerminalController extends Controller
{
    public function createTerminal(){
        return view('backend.terminal.create');
    }
}
