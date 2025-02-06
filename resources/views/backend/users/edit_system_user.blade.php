@extends('backend.master')

@section('page_title')
    Counter Operators
@endsection
@section('page_heading')
    Edit Counter Operator Info
@endsection

@section('header_css')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <style>
        form i {
            margin-left: -30px;
            cursor: pointer;
        }
    </style>
@endsection

@section('content')

    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Counter Operator Update Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('update/system/user')}}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="user_id" value="{{$userInfo->id}}">


                        <div class="form-group row">
                            <label for="terminal_id" class="col-sm-2 col-form-label">Select Terminal <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <select class="form-control" name="terminal_id" id="terminal_id" required>
                                    <option value="">Select One</option>
                                    @foreach ($terminals as $terminal)
                                    <option value="{{$terminal->id}}" @if($userInfo->terminal_id == $terminal->id) selected @endif>{{$terminal->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="counter_id" class="col-sm-2 col-form-label">Select Counter <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <select class="form-control" name="counter_id" id="counter_id" required>
                                    <option value="">Select One</option>
                                    @foreach ($counters as $counter)
                                    <option value="{{$counter->id}}" @if($userInfo->counter_id == $counter->id) selected @endif>{{$counter->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="colFormLabel" class="col-sm-2 col-form-label">Full Name <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" name="name" class="form-control" id="colFormLabel" value="{{$userInfo->name}}" placeholder="Full Name" required>
                                <div class="invalid-feedback" style="display: block;">
                                    @error('name')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-sm-2 col-form-label">Login Email <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <input type="email" name="email" class="form-control" id="email" value="{{$userInfo->email}}" placeholder="example@GenericCommerceV1.com" required>
                                <div class="invalid-feedback" style="display: block;">
                                    @error('email')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-sm-2 col-form-label">Login Password</label>
                            <div class="col-sm-8">
                                <input type="password" name="password" class="form-control d-inline-block" id="password" placeholder="********">
                                <i class="bi bi-eye-slash" id="togglePassword"></i>
                                <div class="invalid-feedback" style="display: block;">
                                    @error('password')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="phone" class="col-sm-2 col-form-label">Phone</label>
                            <div class="col-sm-8">
                                <input type="phone" name="phone" class="form-control" id="phone" value="{{$userInfo->phone}}" placeholder="+8801*********">
                                <div class="invalid-feedback" style="display: block;">
                                    @error('phone')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="address" class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-8">
                                <input type="address" name="address" class="form-control" value="{{$userInfo->address}}" id="address" placeholder="Dhaka, Bangladesh">
                                <div class="invalid-feedback" style="display: block;">
                                    @error('address')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label"></label>
                            <div class="col-sm-8">
                                <button class="btn btn-primary" type="submit">Update User Info</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section("footer_js")
    <script>
        const togglePassword = document.querySelector("#togglePassword");
        const password = document.querySelector("#password");

        togglePassword.addEventListener("click", function () {
            // toggle the type attribute
            const type = password.getAttribute("type") === "password" ? "text" : "password";
            password.setAttribute("type", type);

            // toggle the icon
            this.classList.toggle("bi-eye");
        });

        // prevent form submit
        const form = document.querySelector("form");
        form.addEventListener('submit', function (e) {
            e.preventDefault();
        });

        $(document).ready(function () {
            $('#terminal_id').on('change', function () {
                var terminal_id = this.value;
                $("#counter_id").html('');
                $.ajax({
                    url: "{{url('/terminal/wise/counter')}}",
                    type: "POST",
                    data: {
                        terminal_id: terminal_id,
                        _token: '{{csrf_token()}}'
                    },
                    dataType: 'json',
                    success: function (result) {
                        $('#counter_id').html('<option value="">Select Counter</option>');
                        $.each(result, function (key, value) {
                            $("#counter_id").append('<option value="' + value.id + '">' + value.name + '</option>');
                        });
                    }
                });
            });
        });
    </script>
@endsection

