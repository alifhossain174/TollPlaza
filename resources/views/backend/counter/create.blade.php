@extends('backend.master')

@section('page_title')
    Counter
@endsection
@section('page_heading')
    Create New Counter
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-4">Counter Create Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('save/counter')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="form-group row">
                            <label for="terminal_id" class="col-sm-2 col-form-label">Select Terminal <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <select class="form-control" name="terminal_id" id="terminal_id" required>
                                    <option value="">Select One</option>
                                    @foreach ($terminals as $terminal)
                                    <option value="{{$terminal->id}}">{{$terminal->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Name of Counter <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" name="name" class="form-control" id="name" placeholder="Counter Name" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="description" class="col-sm-2 col-form-label">Short Description</label>
                            <div class="col-sm-8">
                                <textarea name="description" rows="3" class="form-control" placeholder="Write Counter Description Here" id="description"></textarea>
                            </div>
                        </div>

                        <div class="form-group row pt-3">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Create Counter</button>
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


