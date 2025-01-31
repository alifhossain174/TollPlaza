@extends('backend.master')

@section('page_title')
    Toll Terminal
@endsection
@section('page_heading')
    Create New Toll Terminal
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-4">Toll Terminal Create Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('save/terminal')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Name of Terminal <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" name="name" class="form-control" id="name" placeholder="Terminal Name" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="description" class="col-sm-2 col-form-label">Short Description</label>
                            <div class="col-sm-8">
                                <textarea name="description" rows="3" class="form-control" placeholder="Write Terminal Description Here" id="description"></textarea>
                            </div>
                        </div>

                        <div class="form-group row pt-3">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Create Terminal</button>
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


