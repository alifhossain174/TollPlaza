@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/css/spectrum.min.css" rel="stylesheet" type="text/css" />
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
@endsection

@section('page_title')
    Vehicle Type
@endsection
@section('page_heading')
    Create New Vehicle Type
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-4">Vehicle Type Create Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('save/vehicle/type')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="form-group row">
                            <label for="type_name" class="col-sm-2 col-form-label">Name of Vehicle Type <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" name="type_name" class="form-control" id="type_name" placeholder="Vehicle Type" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="price" class="col-sm-2 col-form-label">Price for Vehicle <span class="text-danger">*</span></label>
                            <div class="col-sm-3">
                                <input type="number" name="price" value="0" class="form-control" id="price" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="color_code" class="col-sm-2 col-form-label">Color Code</label>
                            <div class="col-sm-3">
                                <input type="text" name="color_code" class="form-control" placeholder="#00000" id="color_code">
                                <small>For Toll Collection Receipt</small>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="description" class="col-sm-2 col-form-label">Short Description</label>
                            <div class="col-sm-8">
                                <textarea name="description" rows="3" class="form-control" id="description"></textarea>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="colFormLabel" class="col-sm-2 col-form-label">Vehicle Type Icon</label>
                            <div class="col-sm-3">
                                <input type="file" name="icon" class="dropify" data-height="150" data-max-file-size="1M" accept="image/*"/>
                            </div>
                        </div>

                        <div class="form-group row pt-3">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Create Vehicle Type</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('footer_js')
    <script src="{{url('assets')}}/plugins/dropify/dropify.min.js"></script>
    <script src="{{url('assets')}}/pages/fileuploads-demo.js"></script>
    <script src="{{url('assets')}}/js/spectrum.min.js"></script>
    <script>
        $("#color_code").spectrum({
            preferredFormat: 'hex',
        });
    </script>
@endsection


