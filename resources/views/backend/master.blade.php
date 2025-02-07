<!DOCTYPE html>
<html lang="en">

@php
    $generalInfo = DB::table('general_infos')->where('id', 1)->select('company_name')->first();
@endphp

<head>
    <meta charset="utf-8" />
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    {{-- to stop indexing --}}
    <meta name="robots" content="noindex, nofollow">

    <meta content="Admin Panel" name="description"/>
    <meta content="Getup Ltd." name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- App favicon -->
    <link rel="shortcut icon" href="{{ url('assets') }}/images/favicon.ico">

    <!-- App css -->
    <link href="{{ url('assets') }}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('assets') }}/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('assets') }}/css/theme.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('assets') }}/css/toastr.min.css" rel="stylesheet" type="text/css" />

    @yield('header_css')
    @yield('header_js')

</head>

<body>

    <!-- Begin page -->
    <div id="layout-wrapper">

        <!-- ========== Left Sidebar Start ========== -->
        <div class="vertical-menu">

            <div data-simplebar class="h-100">

                <!-- LOGO -->
                <div class="navbar-brand-box">
                    <a href="{{ url('/home') }}" class="logo mt-2" style="display: inline-block;">
                        <h3 style="color: white; margin-top: 20px">{{$generalInfo->company_name}}</h3>
                    </a>
                </div>

                <!--- Sidemenu -->
                <div id="sidebar-menu">

                    @if(Auth::user()->user_type == 1)
                        @include('backend.sidebar')
                    @else
                        @include('backend.sidebarWithAssignedMenu')
                    @endif

                </div>
                <!-- Sidebar -->
            </div>
        </div>
        <!-- Left Sidebar End -->

        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->
        <div class="main-content">

            <header id="page-topbar">
                <div class="navbar-header">
                    <div class="d-flex align-items-center">
                        <button type="button" class="btn btn-sm mr-2 d-lg-none header-item" id="vertical-menu-btn">
                            <i class="fa fa-fw fa-bars"></i>
                        </button>

                        <div class="header-breadcumb">
                            <h6 class="header-pretitle d-none d-md-block">Pages <i
                                    class="dripicons-arrow-thin-right"></i> @yield('page_title')</h6>
                            <h2 class="header-title">@yield('page_heading')</h2>
                        </div>
                    </div>
                    <div class="d-flex align-items-center">

                        @if(DB::table('counter_sessions')->where('user_id', Auth::user()->id)->where('counter_status', 0)->exists())
                        <div class="dropdown d-inline-block ml-2">
                            <a href="javascript:void(0)" id="counterCheckoutBtn" class="btn text-white rounded" style="background: #c31432;
                                background: -webkit-linear-gradient(to right, #240b36, #c31432);  /* Chrome 10-25, Safari 5.1-6 */
                                background: linear-gradient(to right, #240b36, #c31432);">
                                <i class="fas fa-sign-out-alt"></i> Counter Checkout
                            </a>
                        </div>
                        @endif

                        <div class="dropdown d-inline-block ml-2">
                            <button type="button" class="btn header-item" id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="rounded-circle header-profile-user" src="{{ url('assets') }}/images/users/avatar-1.jpg" alt="Header Avatar">
                                <span class="d-none d-sm-inline-block ml-1">@auth {{ Auth::user()->name }} @endauth</span>
                                <i class="mdi mdi-chevron-down d-none d-sm-inline-block"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item d-flex align-items-center justify-content-between" href="{{ url('/change/password/page') }}">
                                    <span class="d-none d-sm-inline-block"><i class="fas fa-key"></i> Change Password</span>
                                </a>
                                <a href="{{ route('logout') }}" class="dropdown-item d-flex align-items-center justify-content-between logout" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                    <span class="d-none d-sm-inline-block"><i class="fas fa-sign-out-alt"></i> Logout</span>
                                </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                    class="d-none">
                                    @csrf
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </header>

            <div class="page-content">
                <div class="container-fluid">

                    @yield('content')

                </div> <!-- container-fluid -->
            </div>
            <!-- End Page-content -->

            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <?= date('Y') ?> © {{$generalInfo->company_name}}
                        </div>
                        <div class="col-sm-6">
                            <div class="text-sm-right d-none d-sm-block">
                                Design & Developed by Getup Ltd.
                            </div>
                        </div>
                    </div>
                </div>
            </footer>

        </div>
        <!-- end main content-->

    </div>
    <!-- END layout-wrapper -->

    <!-- Overlay-->
    <div class="menu-overlay"></div>

    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="productForm2" name="productForm2" class="form-horizontal">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bold">Counter Checkout</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Opening Balance</label>
                            <input type="text" id="opening_balance" class="form-control" readonly>
                        </div>
                        <div class="form-group">
                            <label>Closing Balance</label>
                            <input type="number" id="closing_balance" class="form-control" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="counterCheckoutSubmit" class="btn btn-primary">Checkout</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!-- jQuery  -->
    <script src="{{ url('assets') }}/js/jquery.min.js"></script>
    <script src="{{ url('assets') }}/js/bootstrap.bundle.min.js"></script>
    <script src="{{ url('assets') }}/js/metismenu.min.js"></script>
    <script src="{{ url('assets') }}/js/waves.js"></script>
    <script src="{{ url('assets') }}/js/simplebar.min.js"></script>
    <script src="{{ url('assets') }}/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
    <script src="{{ url('assets') }}/plugins/morris-js/morris.min.js"></script>
    <script src="{{ url('assets') }}/plugins/raphael/raphael.min.js"></script>
    <script src="{{ url('assets') }}/pages/dashboard-demo.js"></script>
    <script src="{{ url('assets') }}/js/theme.js"></script>

    <script>
        const handleScroll = () => {
            var Sidebar = document.querySelector('.simplebar-content-wrapper')
            var scrollPosition = Sidebar.scrollTop;
            localStorage.setItem('scroll_nav', scrollPosition);
        }
        document.addEventListener('DOMContentLoaded', function() {
            var Sidebar = document.querySelector('.simplebar-content-wrapper');
            const Location = window.location.pathname;
            Sidebar.onscroll = handleScroll;

            let scroll_nav = localStorage.getItem('scroll_nav');
            if (scroll_nav && Location != '/dashboard') {
                Sidebar.scrollTop = scroll_nav;
            } else {
                Sidebar.scrollTop = 0;
                localStorage.setItem('scroll_nav', 0);
            }
        });

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#counterCheckoutBtn').click(function () {
            $('#productForm2').trigger("reset");
            $('#exampleModal2').modal('show');
            $('#opening_balance').val("Loading Opening Balance...");
            $.get("{{ url('counter/session/info') }}", function (data) {
                $('#opening_balance').val(data.opening_balance);
            })
        });

        $('#counterCheckoutSubmit').click(function (e) {
            e.preventDefault();

            let openingBalance = $('#opening_balance').val().trim();
            let closingBalance = $("#closing_balance").val().trim();
            if (closingBalance === '' || isNaN(closingBalance) || parseFloat(closingBalance) < 0) {
                toastr.error("Please enter a valid number greater than or equal to 0");
                return false;
            }

            if(openingBalance === '' || isNaN(openingBalance) || parseFloat(openingBalance) < 0){
                toastr.error("Wait For the Opening Balance to Show");
                return false;
            }

            if(parseFloat(closingBalance) < parseFloat(openingBalance)){
                toastr.error("Closing cannot be smaller than Opening");
                return false;
            }

            var formData = new FormData();
            formData.append("closing_balance", $("#closing_balance").val());

            $(this).html('Checking Out..');
            $.ajax({
                data: formData,
                url: "{{ url('submit/counter/checkout') }}",
                type: "POST",
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    toastr.success("Checked Out", "Checked Out Successfully");
                    $('#counterCheckoutSubmit').html('Checked Out');
                    $('#productForm2').trigger("reset");
                    $('#exampleModal2').modal('hide');
                    location.reload(true);
                },
                error: function (data) {
                    toastr.error("Failed", "Something Went Wrong");
                    console.log('Error:', data);
                    $('#submitCounterCheckIn').html('Try Again');
                }
            });

        });
    </script>

    @yield('footer_js')

    <script src="{{ url('assets') }}/js/toastr.min.js"></script>
    {!! Toastr::message() !!}

</body>

</html>
