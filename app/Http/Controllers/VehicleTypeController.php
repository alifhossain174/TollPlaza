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
        VehicleType::insert([
            'type_name' => $request->type_name,
            'price' => $request->price,
            'color_code' => $request->color_code,
            'description' => $request->description,
            'status' => 1,
            'slug' => time().str::random(5),
            'created_at' => Carbon::now()
        ]);

        Toastr::success('New Vehicle Type Created', 'Success');
        return back();
    }

    public function viewVehicleTypes(Request $request){
        if ($request->ajax()) {
            $data = VehicleType::orderBy('id', 'desc')->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return '<span style="color:green; font-weight: 600">Active</span>';
                        } else {
                            return '<span style="color:#DF3554; font-weight: 600">Inactive</span>';
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
        VehicleType::where('id', $id)->delete();
        return response()->json(['success' => 'Vehicle Type deleted successfully.']);
    }

    public function editVehicleType($id){
        $vehicleTypeInfo = VehicleType::where('id', $id)->first();
        return view('backend.vehicle_type.update', compact('vehicleTypeInfo'));
    }

    public function updateVehicleType(Request $request){

        VehicleType::where('id', $request->vehicle_type_id)->update([
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
}
