<?php

namespace App\Http\Controllers;

use App\Models\TollTicket;
use App\Models\User;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        if(Auth::user()->user_type == 1){
            $tollTickets = TollTicket::orderBy('id', 'desc')->skip(0)->limit(6)->get();
            $vehicleCounts = DB::table('toll_tickets')
                            ->select('vehicle_type_id', 'vehicle_type_name', DB::raw('COUNT(*) as total'))
                            ->groupBy('vehicle_type_id')
                            ->orderByDesc('total') // Order by count in descending order
                            ->limit(6) // Take only 6 rows
                            ->get();
        } else {
            $tollTickets = TollTicket::where('user_id', Auth::user()->id)->orderBy('id', 'desc')->skip(6)->limit(10)->get();
            $vehicleCounts = DB::table('toll_tickets')
                            ->select('vehicle_type_id', 'vehicle_type_name', DB::raw('COUNT(*) as total'))
                            ->groupBy('vehicle_type_id')
                            ->where('user_id', Auth::user()->id)
                            ->orderByDesc('total') // Order by count in descending order
                            ->limit(6) // Take only 6 rows
                            ->get();
        }
        return view('backend.dashboard', compact('tollTickets', 'vehicleCounts'));
    }

    public function changePasswordPage(){
        return view('backend.change_password');
    }

    public function changePassword(Request $request){

        $currentPassword = $request->prev_password;
        $newPassword = $request->new_password;
        $userId = $request->user_id;
        $userInfo = User::where('id', $userId)->first();

        if(Hash::check($currentPassword, $userInfo->password)){
            User::where('id', $userId)->update([
                'name' => $request->name,
                'password' => Hash::make($newPassword),
            ]);

            Toastr::success('Password Changed', 'Successfully');
            return back();
        } else {
            Toastr::error('Current Password is Wrong', 'Failed');
            return back();
        }

    }

    public function clearCache(){
        Artisan::call('cache:clear');
        Artisan::call('config:clear');
        Artisan::call('view:clear');
        Artisan::call('route:clear');

        Toastr::success('Cahce Cleared', 'Successfully');
        return back();
    }
}
