@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/css/spectrum.min.css" rel="stylesheet" type="text/css" />
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
@endsection

@section('page_title')
    Vehicle Type
@endsection

@section('page_heading')
    Update Vehicle Type
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-4">Vehicle Type Update Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('update/vehicle/type')}}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="vehicle_type_id" value="{{$vehicleTypeInfo->id}}">

                        <div class="form-group row">
                            <label for="type_name" class="col-sm-2 col-form-label">Name of Vehicle Type <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" name="type_name" class="form-control" id="type_name" value="{{$vehicleTypeInfo->type_name}}" placeholder="Vehicle Type" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="description" class="col-sm-2 col-form-label">Short Description</label>
                            <div class="col-sm-8">
                                <textarea name="description" rows="3" class="form-control" placeholder="Write Short Description Here" id="description">{{$vehicleTypeInfo->description}}</textarea>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="price" class="col-sm-2 col-form-label">Price for Vehicle <span class="text-danger">*</span></label>
                            <div class="col-sm-3">
                                <input type="number" name="price" class="form-control" value="{{$vehicleTypeInfo->price}}" id="price" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="color_code" class="col-sm-2 col-form-label">Color Code</label>
                            <div class="col-sm-3">
                                <input type="text" name="color_code" class="form-control" value="{{$vehicleTypeInfo->color_code}}" placeholder="#00000" id="color_code">
                                <small>For Toll Collection Receipt</small>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="colFormLabel" class="col-sm-2 col-form-label">Vehicle Type Icon</label>
                            <div class="col-sm-3">
                                <input type="file" name="icon" class="dropify" data-height="150" data-max-file-size="1M" accept="image/*"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="status" class="col-sm-2 col-form-label">Status <span class="text-danger">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" name="status" id="status" required>
                                    <option value="">Select One</option>
                                    <option value="1" @if($vehicleTypeInfo->status == 1) selected @endif>Active</option>
                                    <option value="0" @if($vehicleTypeInfo->status == 0) selected @endif>Inactive</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row pt-3">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Update Vehicle Type</button>
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
    <script src="{{url('assets')}}/plugins/dropify/dropify.min.js"></script>
    <script src="{{url('assets')}}/pages/fileuploads-demo.js"></script>
    <script>
        $("#color_code").spectrum({
            preferredFormat: 'hex',
        });

        @if($vehicleTypeInfo->icon && file_exists(public_path($vehicleTypeInfo->icon)))
            $(".dropify-preview").eq(0).css("display", "block");
            $(".dropify-clear").eq(0).css("display", "block");
            $(".dropify-filename-inner").eq(0).html("{{$vehicleTypeInfo->icon}}");
            $("span.dropify-render").eq(0).html("<img src='{{url($vehicleTypeInfo->icon)}}'>");
        @endif
    </script>
@endsection


