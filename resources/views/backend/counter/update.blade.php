@extends('backend.master')

@section('page_title')
    Counter
@endsection
@section('page_heading')
    Update Counter
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-4">Counter Update Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('update/counter')}}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="counter_id" value="{{$counterInfo->id}}">

                        <div class="form-group row">
                            <label for="terminal_id" class="col-sm-2 col-form-label">Select Terminal <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <select class="form-control" name="terminal_id" id="terminal_id" required>
                                    <option value="">Select One</option>
                                    @foreach ($terminals as $terminal)
                                    <option value="{{$terminal->id}}" @if($counterInfo->terminal_id == $terminal->id) selected @endif>{{$terminal->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Name of Counter <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" name="name" class="form-control" id="name" value="{{$counterInfo->name}}" placeholder="Counter Name" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="description" class="col-sm-2 col-form-label">Short Description</label>
                            <div class="col-sm-8">
                                <textarea name="description" rows="3" class="form-control" placeholder="Write Counter Description Here" id="description">{{$counterInfo->description}}</textarea>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="status" class="col-sm-2 col-form-label">Status <span class="text-danger">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" name="status" id="status" required>
                                    <option value="">Select One</option>
                                    <option value="1" @if($counterInfo->status == 1) selected @endif>Active</option>
                                    <option value="0" @if($counterInfo->status == 0) selected @endif>Inactive</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row pt-3">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Update Counter</button>
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


