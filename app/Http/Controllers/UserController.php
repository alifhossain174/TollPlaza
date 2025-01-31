<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\User;
use App\Models\UserAddress;
use App\Models\UserCard;
use App\Models\UserRolePermission;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Brian2694\Toastr\Facades\Toastr;
use DateTime;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\DataTables;

class UserController extends Controller
{
    public function viewAllCustomers(Request $request){
        if ($request->ajax()) {

            // $query = DB::table('users')
            //             ->leftJoin('orders', 'users.id', 'orders.user_id')
            //             ->leftJoin('order_details', 'orders.id', 'order_details.order_id')
            //             ->leftJoin('products', 'order_details.product_id', 'products.id')
            //             ->leftJoin('user_addresses', 'users.id', 'user_addresses.user_id')
            //             ->select('users.*', DB::raw('COUNT(DISTINCT orders.id) as total_orders'))
            //             ->where('user_type', 3)
            //             ->orderBy('users.id', 'desc')
            //             ->groupBy('users.id');

            $orderAmountSubquery = DB::table('orders')
                                    ->select('user_id', DB::raw('SUM(total) as total_order_amount'))
                                    ->groupBy('user_id');

            $query = DB::table('users')
                        ->leftJoin('orders', 'users.id', '=', 'orders.user_id')
                        ->leftJoin('order_details', 'orders.id', '=', 'order_details.order_id')
                        ->leftJoin('products', 'order_details.product_id', '=', 'products.id')
                        ->leftJoin('user_addresses', 'users.id', '=', 'user_addresses.user_id')
                        ->leftJoinSub($orderAmountSubquery, 'order_totals', function($join) {
                            $join->on('users.id', '=', 'order_totals.user_id');
                        })
                        ->select(
                            'users.*',
                            DB::raw('COUNT(DISTINCT orders.id) as total_orders'),
                            DB::raw('COALESCE(order_totals.total_order_amount, 0) as total_order_amount')
                        )
                        ->where('user_type', 3)
                        ->groupBy('users.id')
                        ->orderBy('users.id', 'desc');

            // filter start from here
            if ($request->order_place_date != "") {
                $query->where('orders.order_date', 'LIKE', $request->order_place_date. '%');
            }
            if ($request->order_from != "") {
                $query->where('orders.order_from', $request->order_from);
            }
            if ($request->product_id != "") {
                $query->where('order_details.product_id', $request->product_id);
            }
            if ($request->category_id != "") {
                $query->where('products.category_id', $request->category_id);
            }
            if ($request->district != "") {
                $query->where('user_addresses.city', $request->district);
            }
            if ($request->city != "") {
                $query->where('user_addresses.state', $request->city);
            }
            if ($request->order_status != "") {
                $query->where('orders.order_status', $request->order_status);
            }
            if ($request->coupon_code != "") {
                $query->where('orders.coupon_code', 'LIKE', '%'.$request->coupon_code.'%');
            }
            if ($request->min_order_qty != "") {
                $query->having('total_orders', '>=', $request->min_order_qty);
            }
            if ($request->max_order_qty != "") {
                $query->having('total_orders', '<=', $request->max_order_qty);
            }
            if ($request->min_order_amount != "") {
                $query->having('total_order_amount', '>=', $request->min_order_amount);
            }
            if ($request->max_order_amount != "") {
                $query->having('total_order_amount', '<=', $request->max_order_amount);
            }
            if ($request->create_date_range != '') {
                $dateRange = $request->create_date_range;
                list($startDateStr, $endDateStr) = explode(" - ", $dateRange);
                $startDate = DateTime::createFromFormat("M j, Y", trim($startDateStr));
                $endDate = DateTime::createFromFormat("M j, Y", trim($endDateStr));
                $formattedStartDate = $startDate ? $startDate->format("Y-m-d")." 00:00:00" : null;
                $formattedEndDate = $endDate ? $endDate->format("Y-m-d"). " 23:59:59" : null;
                $query->whereBetween('users.created_at', [$formattedStartDate, $formattedEndDate]);
            }
            // filter end here

            $data = $query->get();

            return Datatables::of($data)
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d h:i:s a", strtotime($data->created_at));
                    })
                    ->editColumn('delete_request_submitted', function($data) {
                        if($data->delete_request_submitted == 1){
                            return "<span style='background: #b00; padding: 2px 10px; border-radius: 4px; color: white'>Yes</span> On <b>".  date("Y-m-d" ,strtotime($data->delete_request_submitted_at))."</b>";
                        }
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'icon', 'delete_request_submitted'])
                    ->make(true);
        }

        $products = DB::table('products')->orderBy('name', 'asc')->get();
        $categories = DB::table('categories')->orderBy('name', 'asc')->get();
        $districts = DB::table('districts')->orderBy('name', 'asc')->get();
        $cities = DB::table('upazilas')->orderBy('name', 'asc')->get();
        return view('backend.users.customers', compact('products', 'categories', 'districts', 'cities'));
    }

    public function viewAllSystemUsers(Request $request){
        if ($request->ajax()) {

            $data = User::whereIn('user_type', [1,2])->where('id', '!=', 1)->orderBy('id', 'desc')->get();

            return Datatables::of($data)
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d h:i:s a", strtotime($data->created_at));
                    })
                    ->editColumn('user_type', function($data) {
                        if($data->user_type == 2){
                            return '<a href="javascript:void(0)" style="background: #090; font-weight: 600;" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Make SuperAdmin" class="btn-sm btn-success rounded makeSuperAdmin">Make SuperAdmin</a>';
                        } else {
                            return '<a href="javascript:void(0)" style="background: #ca0000; font-weight: 600;" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Revoke SuperAdmin" class="btn-sm btn-success rounded revokeSuperAdmin">Revoke SuperAdmin</a>';
                        }
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        if($data->status == 1)
                            $btn = '<input type="checkbox" onchange="changeUserStatus('.$data->id.')" checked data-size="small" data-toggle="switchery" data-color="#53c024" data-secondary-color="#df3554"/>';
                        else
                            $btn = '<input type="checkbox" data-size="small" onchange="changeUserStatus('.$data->id.')" data-toggle="switchery" data-color="#53c024" data-secondary-color="#df3554"/>';
                        $btn .= ' <a href="'.url('/edit/system/user')."/".$data->id.'" class="btn-sm btn-warning rounded"><i class="fas fa-edit"></i></a>';
                        // $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'user_type'])
                    ->make(true);
        }
        return view('backend.users.system_users');
    }

    public function addNewSystemUsers(){
        return view('backend.users.add_system_user');
    }

    public function createSystemUsers(Request $request){

        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string'],
        ]);

        User::insert([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'password' => Hash::make($request->password),
            'user_type' => 2,
            'balance' => 0,
            'created_at' => Carbon::now()
        ]);

        Toastr::success('New System User Created', 'Successfully Created');
        return redirect('/view/system/users');
    }

    public function deleteSystemUser($id){
        $userInfo = User::where('user_type', 2)->where('id', $id)->first();
        UserRolePermission::where('user_id', $userInfo->id)->delete();
        User::where('id', $id)->delete();
        return response()->json(['success' => 'Deleted successfully']);
    }

    public function editSystemUser($id){
        $userInfo = User::where('id', $id)->first();
        return view('backend.users.edit_system_user', compact('userInfo'));
    }

    public function updateSystemUser(Request $request){
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255'],
        ]);

        User::where('id', $request->user_id)->update([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            // 'user_type' => 2,
            'updated_at' => Carbon::now()
        ]);

        if($request->password){
            User::where('id', $request->user_id)->update([
                'password' => Hash::make($request->password),
            ]);
        }

        Toastr::success('System User Info Updated', 'Successfully Updated');
        return redirect('/view/system/users');
    }

    public function changeUserStatus($id){

        $userInfo = User::where('id', $id)->first();
        $userInfo->status = $userInfo->status == 1 ? 0 : 1;
        $userInfo->updated_at = Carbon::now();
        $userInfo->save();

        return response()->json(['success' => 'Status Changed successfully']);
    }

    public function deleteCustomer($id){
        $userInfo = User::where('user_type', 3)->where('id', $id)->first();
        if($userInfo){

            $orderInfo = Order::where('user_id', $userInfo->id)->get();

            if(count($orderInfo) > 0){
                return response()->json(['success' => 'Customer cannot be deleted', 'data' => 0]);
            } else {
                // delete process start
                UserCard::where('user_id', $userInfo->id)->delete();
                UserAddress::where('user_id', $userInfo->id)->delete();
                $userInfo->delete();
                return response()->json(['success' => 'Customer deleted successfully.', 'data' => 1]);
            }

        } else {
            return response()->json(['success' => 'Customer deleted successfully.', 'data' => 1]);
        }
    }

    public function makeSuperAdmin($id){
        $userInfo = User::where('id', $id)->first();
        $userInfo->user_type = 1;
        $userInfo->save();
        return response()->json(['success' => 'Made SuperAdmin Successfully']);
    }

    public function revokeSuperAdmin($id){
        $userInfo = User::where('id', $id)->first();
        $userInfo->user_type = 2;
        $userInfo->save();
        return response()->json(['success' => 'Revoke SuperAdmin Successfully']);
    }
}
