@extends('backend.master')

@section('header_css')
    <style>
        .vehicle_types{
            display: flex;
            flex-wrap: wrap;
            gap: 10px; /* Adjust spacing between items */
        }
        label.rides{
            flex: 1 1 calc(25% - 12px); /* 25% width per item minus gap */
            min-height: 120px; /* Adjust as needed */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            box-sizing: border-box;

            /* my css */
            position: relative;
            border-radius: 4px;
            padding: 8px 2px;
            cursor: pointer;
            border: 2px solid lightgray;
            transition: all linear 0.1s;
            color: #1e1e1e;
        }
        label.rides:hover{
            box-shadow: 2px 2px 5px gray;
            border: 3px solid #1e1e1e;
        }

        .ride_selection_box{
            /* height: 500px;
            overflow-y: scroll; */
            border: 1px solid lightgray;
            padding: 12px 12px;
            border-radius: 4px;
        }

        label.rides input[type="radio"] {
            accent-color: rgb(255, 98, 0);
            /* hide this */
            width: 0px;
            height: 0px;
            opacity: 0;
            pointer-events: none;
        }

        label.rides span.vehicle_type_price{
            position: absolute;
            top: 5px;
            left: 5px;
            font-size: 16px;
            font-weight: 600;
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

                            <div class="col-lg-7 ride_selection_box">
                                <h6 class="mb-2">Select Vehicle Type</h6>

                                <div class="vehicle_types">
                                    @foreach ($vehicleTypes as $vehicleType)
                                        <label class="rides m-0" style="@if($vehicleType->color_code) background: {{$vehicleType->color_code}} @else background:transparent @endif">
                                            @if(file_exists(public_path($vehicleType->icon)))
                                            <img src="{{url($vehicleType->icon)}}" style="width: 60px; height: 60px; margin: auto;" class="d-block mb-2">
                                            @endif
                                            <input type="radio" name="vehicle_type_id" onchange="calculateTicketPrice({{$vehicleType->price}}, '{{$vehicleType->type_name}}')" data-price="{{$vehicleType->price}}" value="{{$vehicleType->id}}" required>
                                            {{$vehicleType->type_name}}
                                            <span class="d-inline-block vehicle_type_price">৳{{$vehicleType->price}}</span>
                                        </label>
                                    @endforeach
                                </div>
                            </div>

                            <div class="col-lg-5 pt-4 pl-4">

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="terminal_id">From Terminal<span class="text-danger">*</span> </label>
                                            @if(Auth::user()->user_type == 1)
                                            <select class="form-control" name="terminal_id" id="terminal_id" required>
                                                <option value="">Select One</option>
                                                @foreach ($terminals as $terminal)
                                                <option value="{{$terminal->id}}">{{$terminal->name}}</option>
                                                @endforeach
                                            </select>
                                            @else
                                            @php
                                                $userTerminal = App\Models\Terminal::where('id', Auth::user()->terminal_id)->first();
                                            @endphp
                                            <input type="text" class="form-control" id="terminal_id" value="{{$userTerminal->name}}" required readonly>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="user_id">Operator Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="user_id" value="{{Auth::user()->name}}" required readonly>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="vehicle_reg_no">Vehicle Type</label>
                                            <input type="text" class="form-control" id="vehicle_type_text" placeholder="Vehicle Type" readonly>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="vehicle_reg_no">Vehicle Reg. No</label>
                                            <input type="text" class="form-control" name="vehicle_reg_no" id="vehicle_reg_no" placeholder="e.g. Dhaka-Metro-KA">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="ticket_price">Ticket Price<span class="text-danger">*</span> </label>
                                            <input type="text" class="form-control" name="ticket_price" id="ticket_price" placeholder="0" readonly>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="payment_method">Payment Method<span class="text-danger">*</span> </label>
                                            <select class="form-control" name="payment_method" id="payment_method" required>
                                                <option value="">Select One</option>
                                                <option value="1" selected>Cash</option>
                                                <option value="2">bKash</option>
                                                <option value="3">Nagad</option>
                                                <option value="4">Card</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <hr>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="amount_given">Amount Given</label>
                                            <input type="text" class="form-control" name="amount_given" id="amount_given">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="return_change">Return Change</label>
                                            <input type="text" class="form-control" name="return_change" id="return_change" readonly>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group text-center pt-2">
                                    <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Print Ticket</button>
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

        function calculateTicketPrice(price, type_name){
            $("#ticket_price").val(price);
            $("#vehicle_type_text").val(type_name);

            calculateChange();
        }

        function calculateChange() {
            const ticketPriceInputed = document.getElementById("ticket_price");
            const amountGivenInputed = document.getElementById("amount_given");
            const returnChangeInputed = document.getElementById("return_change");

            const ticketPrice = parseFloat(ticketPriceInputed.value) || 0;
            const amountGiven = parseFloat(amountGivenInputed.value) || 0;
            const returnChange = amountGiven - ticketPrice;
            returnChangeInputed.value = returnChange >= 0 ? returnChange : "";
        }

        document.addEventListener("DOMContentLoaded", function () {
            const ticketPriceInput = document.getElementById("ticket_price");
            const amountGivenInput = document.getElementById("amount_given");

            ticketPriceInput.addEventListener("input", calculateChange);
            amountGivenInput.addEventListener("input", calculateChange);

            // Perform initial calculation on page load
            calculateChange();
        });

    </script>
@endsection


