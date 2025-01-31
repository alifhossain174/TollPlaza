@extends('backend.master')

@section('page_title')
    System Config
@endsection
@section('page_heading')
    Enter General Information
@endsection

@section('content')
<div class="row">
    <div class="col-lg-12 col-xl-12">
        <div class="card">
            <div class="card-body">
                <form class="needs-validation" method="POST" action="{{url('update/general/info')}}"
                    enctype="multipart/form-data">
                    @csrf

                    <div class="row">
                        <div class="col-lg-8">
                            <h4 class="card-title mb-3">General Information Form</h4>
                        </div>
                        <div class="col-lg-4 text-right">

                            <a href="{{url('/home')}}" style="width: 130px;"
                                class="btn btn-danger d-inline-block text-white m-2" type="submit"><i
                                    class="mdi mdi-cancel"></i> Cancel</a>
                            <button class="btn btn-primary m-2" type="submit" style="width: 140px;"><i
                                    class="fas fa-save"></i> Update Info</button>

                        </div>
                    </div>

                    <div class="row justify-content-center pt-3">
                        <div class="col-lg-9">

                            <div class="form-group row">
                                <label for="company_name" class="col-sm-2 col-form-label">Company Name <span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <input type="text" id="company_name" name="company_name" value="{{$data->company_name}}" class="form-control" placeholder="Enter Company Name Here" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ticket_header" class="col-sm-2 col-form-label">Ticket Header <span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <input type="text" id="ticket_header" name="ticket_header" value="{{$data->ticket_header}}" class="form-control" placeholder="Enter Ticket Header" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ticket_title" class="col-sm-2 col-form-label">Ticket Ttile <span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <input type="text" id="ticket_title" name="ticket_title" value="{{$data->ticket_title}}" class="form-control" placeholder="Enter Ticket Title" required>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="contact" class="col-sm-2 col-form-label">Contact Info</label>
                                <div class="col-sm-5">
                                    <input type="text" id="contact" name="contact" value="{{$data->contact}}" class="form-control" placeholder="01*********">
                                </div>
                                <div class="col-sm-5">
                                    <input type="text" id="email" name="email" value="{{$data->email}}" class="form-control" placeholder="sample@email.com">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="short_description" class="col-sm-2 col-form-label">Short Description</label>
                                <div class="col-sm-10">
                                    <textarea id="short_description" rows="3" name="short_description" class="form-control">{!! $data->short_description !!}</textarea>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('short_description')
                                        {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="address" class="col-sm-2 col-form-label">Toll Plaza Address</label>
                                <div class="col-sm-10">
                                    <input type="text" id="address" name="address" class="form-control" value="{{$data->address}}" placeholder="Enter Company Address Here">
                                </div>
                            </div>


                            <div class="form-group text-center">
                                <a href="{{url('/home')}}" style="width: 130px;"
                                    class="btn btn-danger d-inline-block text-white m-2" type="submit"><i
                                        class="mdi mdi-cancel"></i> Cancel</a>
                                <button class="btn btn-primary m-2" type="submit" style="width: 140px;"><i
                                        class="fas fa-save"></i> Update Info</button>
                            </div>

                        </div>

                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
@endsection
