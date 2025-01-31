<?php

namespace App\Http\Controllers;

use App\Models\GeneralInfo;
use Carbon\Carbon;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class GeneralInfoController extends Controller
{
    public function generalInfo(Request $request){
        $data = GeneralInfo::where('id', 1)->first();
        return view('backend.general_info.info', compact('data'));
    }

    public function updateGeneralInfo(Request $request){
        $data = GeneralInfo::where('id', 1)->first();

        GeneralInfo::where('id', 1)->update([
            'company_name' => $request->company_name,
            'short_description' => $request->short_description,
            'contact' => $request->contact,
            'email' => $request->email,
            'address' => $request->address,
            'ticket_header' => $request->ticket_header,
            'ticket_title' => $request->ticket_title,
            'updated_at' => Carbon::now()
        ]);

        Toastr::success('General Info Updated', 'Success');
        return back();
    }
}
