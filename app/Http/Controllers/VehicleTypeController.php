<?php

namespace App\Http\Controllers;

use App\Models\VehicleType;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Brian2694\Toastr\Facades\Toastr;

class VehicleTypeController extends Controller
{
    public function createVehicleType(){
        return view('backend.vehicle_type.create');
    }

    public function saveVehicleType(Request $request){

        $icon = null;
        if ($request->hasFile('icon')){
            $get_image = $request->file('icon');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('vehicle_type_icons/');
            $get_image->move($location, $image_name);
            $icon = "vehicle_type_icons/" . $image_name;
        }

        VehicleType::insert([
            'icon' => $icon,
            'type_name' => $request->type_name,
            'price' => $request->price,
            'color_code' => $request->color_code,
            'description' => $request->description,
            'status' => 1,
            'slug' => time().str::random(5),
            'serial' => VehicleType::min('serial') - 1,
            'created_at' => Carbon::now()
        ]);

        Toastr::success('New Vehicle Type Created', 'Success');
        return back();
    }

    public function viewVehicleTypes(Request $request){
        if ($request->ajax()) {
            $data = VehicleType::orderBy('serial', 'asc')->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return '<span style="color:green; font-weight: 600">Active</span>';
                        } else {
                            return '<span style="color:#DF3554; font-weight: 600">Inactive</span>';
                        }
                    })
                    ->editColumn('icon', function($data) {
                        if($data->icon && file_exists(public_path($data->icon))){
                            return $data->icon;
                        }
                    })
                    ->editColumn('color_code', function($data) {
                        return "<span style='background-color: ".$data->color_code.";color: ".$data->color_code."; height:18px; width: 40px; display: inline-block; border-radius: 4px; cursor: pointer; box-shadow: 1px 1px 2px gray;'>Color</span>";
                    })
                    ->editColumn('price', function($data) {
                        return $data->price." BDT";
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="'.url('edit/vehicle/type').'/'.$data->id.'" class="mb-1 btn-sm btn-warning rounded"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'status', 'color_code'])
                    ->make(true);
        }
        return view('backend.vehicle_type.view');
    }

    public function deleteVehicleType($id){
        $data = VehicleType::where('id', $id)->first();
        if($data->icon){
            if(file_exists(public_path($data->icon))){
                unlink(public_path($data->icon));
            }
        }
        $data->delete();
        return response()->json(['success' => 'Vehicle Type deleted successfully.']);
    }

    public function editVehicleType($id){
        $vehicleTypeInfo = VehicleType::where('id', $id)->first();
        return view('backend.vehicle_type.update', compact('vehicleTypeInfo'));
    }

    public function updateVehicleType(Request $request){

        $data = VehicleType::where('id', $request->vehicle_type_id)->first();

        $icon = $data->icon;
        if ($request->hasFile('icon')){
            if($icon != '' && file_exists(public_path($icon))){
                unlink(public_path($icon));
            }
            $get_image = $request->file('icon');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('vehicle_type_icons/');
            $get_image->move($location, $image_name);
            $icon = "vehicle_type_icons/" . $image_name;
        }

        VehicleType::where('id', $request->vehicle_type_id)->update([
            'icon' => $icon,
            'type_name' => $request->type_name,
            'price' => $request->price,
            'color_code' => $request->color_code,
            'description' => $request->description,
            'status' => $request->status,
            'updated_at' => Carbon::now()
        ]);

        Toastr::success('Vehicle Type Updated', 'Success');
        return redirect('/view/vehicle/types');
    }

    public function rearrangeVehicleType(){
        $vehicleTypes = VehicleType::orderBy('serial', 'asc')->get();
        return view('backend.vehicle_type.rearrange', compact('vehicleTypes'));
    }

    public function saveRearrangedVehicleType(Request $request){
        $sl = 1;
        foreach($request->slug as $slug){
            VehicleType::where('slug', $slug)->update([
                'serial' => $sl
            ]);
            $sl++;
        }
        Toastr::success('Vehicle Types has been Rerranged', 'Success');
        return redirect('/view/vehicle/types');
    }

}
