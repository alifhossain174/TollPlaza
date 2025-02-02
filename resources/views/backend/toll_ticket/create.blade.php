@extends('backend.master')

@section('header_css')
    <style>
        label.rides{
            display: inline-block;
            text-align: center;
            font-size: 15px;
            padding: 8px 2px;
            width: 48%;
            border-radius: 4px;
            margin: 4px 2px;
            cursor: pointer;
            border: 3px solid transparent;
            transition: all linear 0.1s;
            color: white;
            text-shadow: 1px 1px 2px black;
            position: relative;
        }
        label.rides:hover{
            box-shadow: 2px 2px 5px gray;
            border: 3px solid #1e1e1e;
        }

        .ride_selection_box{
            height: 390px;
            overflow-y: scroll;
            border: 1px solid lightgray;
            padding: 15px;
            border-radius: 4px;
        }

        label.rides input[type="radio"] {
            width: 16px;
            height: 16px;
            accent-color: rgb(255, 98, 0); /* Changes the color of the radio button (modern browsers) */
        }

        label.rides span.vehicle_type_price{
            position: absolute;
            top: 5px;
            left: 5px;
        }

        label.rides:has(input[type="radio"]:checked) {
            box-shadow: 2px 2px 5px gray;
            border: 3px solid #1e1e1e;
        }
    </style>
@endsection

@section('page_title')
    Toll Ticket
@endsection
@section('page_heading')
    Create New Toll Ticket
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-4">Toll Ticket Create Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('save/toll/ticket')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="row">

                            <div class="col-lg-5 ride_selection_box">
                                <h6 class="mb-2">Select Vehicle Type</h6>

                                <div id="search_results">
                                    @foreach ($vehicleTypes as $vehicleType)
                                        <label class="rides" style="background: {{$vehicleType->color_code}}">
                                            @if(file_exists(public_path($vehicleType->icon)))
                                            <img src="{{url($vehicleType->icon)}}" style="width: 60px; height: 60px; margin: auto;" class="d-block mb-2">
                                            @endif
                                            <input type="radio" name="vehicle_type_id" onchange="calculateTicketPrice({{$vehicleType->price}})" data-price="{{$vehicleType->price}}" value="{{$vehicleType->id}}" required>
                                            {{$vehicleType->type_name}}
                                            <span class="d-inline-block vehicle_type_price">৳{{$vehicleType->price}}</span>
                                        </label>
                                    @endforeach
                                </div>
                            </div>

                            <div class="col-lg-7 pt-4">
                                <div class="form-group row">
                                    <label for="terminal_id" class="col-sm-3 col-form-label text-right">Select Terminal<span class="text-danger">*</span> : </label>
                                    <div class="col-sm-9">
                                        <select class="form-control" name="terminal_id" id="terminal_id" required>
                                            <option value="">Select One</option>
                                            @foreach ($terminals as $terminal)
                                            <option value="{{$terminal->id}}">{{$terminal->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="user_id" class="col-sm-3 col-form-label text-right">Terminal Operator<span class="text-danger">*</span> : </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="user_id" value="{{Auth::user()->name}}" required readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="driver" class="col-sm-3 col-form-label text-right">Driver Information : </label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" name="driver_name" id="driver" placeholder="Mr.">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="driver_contact" id="driver" placeholder="+8801">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="vehicle_reg_no" class="col-sm-3 col-form-label text-right">Vehicle Reg. No : </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="vehicle_reg_no" id="vehicle_reg_no" placeholder="e.g. Dhaka-Metro-KA">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="ticket_price" class="col-sm-3 col-form-label text-right">Ticket Price<span class="text-danger">*</span> : </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="ticket_price" id="ticket_price" placeholder="0" readonly>
                                    </div>
                                </div>
                                <div class="form-group row pt-2">
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-9">
                                        <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Print Ticket</button>
                                    </div>
                                </div>
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

        function calculateTicketPrice(price){
            $("#ticket_price").val(price);
        }
    </script>
@endsection


