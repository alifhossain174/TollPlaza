<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Terminal;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Brian2694\Toastr\Facades\Toastr;

class TerminalController extends Controller
{
    public function createTerminal(){
        return view('backend.terminal.create');
    }

    public function saveTerminal(Request $request){
        Terminal::insert([
            'name' => $request->name,
            'description' => $request->description,
            'status' => 1,
            'slug' => time().str::random(5),
            'created_at' => Carbon::now()
        ]);

        Toastr::success('New Terminal Created', 'Success');
        return back();
    }

    public function viewTerminals(Request $request){
        if ($request->ajax()) {
            $data = Terminal::orderBy('id', 'desc')->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return '<span style="color:green; font-weight: 600">Active</span>';
                        } else {
                            return '<span style="color:#DF3554; font-weight: 600">Inactive</span>';
                        }
                    })
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d h:i:s a", strtotime($data->created_at));
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="'.url('edit/terminal').'/'.$data->id.'" class="mb-1 btn-sm btn-warning rounded"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'status'])
                    ->make(true);
        }
        return view('backend.terminal.view');
    }

    public function deleteTerminal($id){
        Terminal::where('id', $id)->delete();
        return response()->json(['success' => 'Terminal deleted successfully.']);
    }

    public function editTerminal($id){
        $terminalInfo = Terminal::where('id', $id)->first();
        return view('backend.terminal.update', compact('terminalInfo'));
    }

    public function updateTerminal(Request $request){
        Terminal::where('id', $request->terminal_id)->update([
            'name' => $request->name,
            'description' => $request->description,
            'status' => $request->status,
            'updated_at' => Carbon::now()
        ]);

        Toastr::success('Terminal Updated', 'Success');
        return redirect('/view/terminals');
    }
}
