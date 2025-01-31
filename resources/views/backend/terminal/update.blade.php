@extends('backend.master')

@section('page_title')
    Toll Terminal
@endsection
@section('page_heading')
    Update Toll Terminal
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-4">Toll Terminal Update Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('update/terminal')}}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="terminal_id" value="{{$terminalInfo->id}}">

                        <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Name of Terminal <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" name="name" class="form-control" value="{{$terminalInfo->name}}" id="name" placeholder="Terminal Name" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="description" class="col-sm-2 col-form-label">Short Description</label>
                            <div class="col-sm-8">
                                <textarea name="description" rows="3" class="form-control" placeholder="Write Terminal Description Here" id="description">{{$terminalInfo->description}}</textarea>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="status" class="col-sm-2 col-form-label">Status <span class="text-danger">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" name="status" id="status" required>
                                    <option value="">Select One</option>
                                    <option value="1" @if($terminalInfo->status == 1) selected @endif>Active</option>
                                    <option value="0" @if($terminalInfo->status == 0) selected @endif>Inactive</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row pt-3">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Update Terminal</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('footer_js')
    <script src="{{url('assets')}}/js/spectrum.min.js"></script>
    <script>
        $("#color_code").spectrum({
            preferredFormat: 'hex',
        });
    </script>
@endsection


