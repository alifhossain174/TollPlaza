@extends('backend.master')

@section('page_title')
    System Operators
@endsection
@section('page_heading')
    Add New System Operator
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
                    <h4 class="card-title mb-3">System Operator Create Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('create/system/user')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="form-group row">
                            <label for="colFormLabel" class="col-sm-2 col-form-label">Full Name <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <input type="text" name="name" class="form-control" id="colFormLabel" placeholder="Full Name" required>
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
                                <input type="email" name="email" class="form-control" id="email" placeholder="example@GenericCommerceV1.com" required>
                                <div class="invalid-feedback" style="display: block;">
                                    @error('email')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-sm-2 col-form-label">Login Password <span class="text-danger">*</span></label>
                            <div class="col-sm-8">
                                <input type="password" name="password" class="form-control d-inline-block" id="password" placeholder="********" required>
                                <i class="bi bi-eye-slash" id="togglePassword"></i>
                                <div class="invalid-feedback" style="display: block;">
                                    @error('password')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-sm-2 col-form-label">Select Terminal <span class="text-danger">*</span></label>
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
                            <label for="phone" class="col-sm-2 col-form-label">Contact No</label>
                            <div class="col-sm-8">
                                <input type="phone" name="phone" class="form-control" id="phone" placeholder="+8801*********">
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
                                <input type="address" name="address" class="form-control" id="address" placeholder="e.g. Dhaka, Bangladesh">
                                <div class="invalid-feedback" style="display: block;">
                                    @error('address')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-sm-2 col-form-label"></label>
                            <div class="col-sm-8">
                                <button class="btn btn-primary" type="submit">Create Operator</button>
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
    </script>
@endsection

