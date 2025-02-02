@extends('backend.master')

@section('header_css')
    <style>
        h4.card-title{
            background: linear-gradient(to right, #17263A, #2c3e50, #17263A);
            padding: 8px 15px;
            border-radius: 4px;
            color: white;
        }
        .graph_card{
            position: relative
        }
        .graph_card i{
            position: absolute;
            top: 18px;
            right: 18px;
            font-size: 18px;
            height: 35px;
            width: 35px;
            line-height: 33px;
            text-align: center;
            border-radius: 50%;
            font-weight: 300;
        }

    </style>
@endsection

@section('page_title')
    Dashboard
@endsection

@section('page_heading')
    Overview
@endsection

@section('content')

    <div class="row">

        @if(Auth::user()->user_type == 1)
        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">No Of Active Terminals</h6>
                            <span class="h3 mb-0"> {{DB::table('terminals')->where('status', 1)->count()}} </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline1" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-toggle-right " style="color: #0074E4; background: #0074E42E;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->
        @else
        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">My Terminal</h6>
                            <span class="h5 mb-0"> {{DB::table('terminals')->where('id', Auth::user()->terminal_id)->first()->name}} </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline1" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-toggle-right " style="color: #0074E4; background: #0074E42E;"></i>
            </div> <!-- end card-->
        </div>
        @endif

        @if(Auth::user()->user_type == 1)
        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Total Active Operators</h6>
                            <span class="h3 mb-0"> {{DB::table('users')->where('status', 1)->where('user_type', 2)->count()}} </span>
                        </div>
                    </div> <!-- end row -->
                    <div id="sparkline2" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-users" style="color: #17263A; background: #17263A3D;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->
        @else
        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Operator Name</h6>
                            <span class="h5 mb-0"> {{Auth::user()->name}} </span>
                        </div>
                    </div> <!-- end row -->
                    <div id="sparkline2" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-users" style="color: #17263A; background: #17263A3D;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->
        @endif

        @if(Auth::user()->user_type == 1)
        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Todays Ticket Collection</h6>
                            <span class="h3 mb-0"> {{number_format(DB::table('toll_tickets')->where('created_at', 'LIKE', date("Y-m-d")."%")->sum('ticket_price'))}}/= </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline3" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-trending-up" style="color: #c28a00; background: #daa5202e;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->
        @else
        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Todays Ticket Collection</h6>
                            <span class="h3 mb-0"> {{number_format(DB::table('toll_tickets')->where('terminal_id', Auth::user()->terminal_id)->where('created_at', 'LIKE', date("Y-m-d")."%")->sum('ticket_price'))}}/= </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline3" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-trending-up" style="color: #c28a00; background: #daa5202e;"></i>
            </div> <!-- end card-->
        </div>
        @endif

        @if(Auth::user()->user_type == 1)
        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Total Ticket Collection</h6>
                            <span class="h3 mb-0"> {{number_format(DB::table('toll_tickets')->sum('ticket_price'))}}/= </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline4" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-trending-up" style="color: #a60000; background: #a6000026;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->
        @else
        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Total Ticket Collection</h6>
                            <span class="h3 mb-0"> {{number_format(DB::table('toll_tickets')->where('terminal_id', Auth::user()->terminal_id)->sum('ticket_price'))}}/= </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline4" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-trending-up" style="color: #a60000; background: #a6000026;"></i>
            </div> <!-- end card-->
        </div>
        @endif
    </div>
    <!-- end row-->

    <div class="row">
        <div class="col-xl-7">
            <div class="card">
                <div class="card-body" style="min-height: 435px;">

                    <h4 class="card-title">Recent Toll Tickets</h4>

                    <div class="table-responsive">
                        <table class="table table-centered table-striped table-nowrap">
                            <thead>
                                <tr>
                                    <th class="text-center">Vehicle Type</th>
                                    <th class="text-center">Entered At</th>
                                    <th class="text-center">Terminal</th>
                                    <th class="text-center">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if(count($tollTickets) > 0)
                                    @foreach ($tollTickets as $tollTicket)
                                    <tr>
                                        <td class="text-center">{{$tollTicket->vehicle_type_name}}</td>
                                        <td class="text-center">{{date("Y-m-d h:i:s a", strtotime($tollTicket->created_at))}}</td>
                                        <td class="text-center">{{$tollTicket->terminal_name}}</td>
                                        <td class="text-center">{{$tollTicket->ticket_price}}/=</td>
                                    </tr>
                                    @endforeach
                                @else
                                <tr>
                                    <td colspan="4" class="text-center">No Data Found</td>
                                </tr>
                                @endif
                            </tbody>
                        </table>
                    </div>

                </div> <!-- end card-body-->
            </div> <!-- end card-->
        </div> <!-- end col -->

        <div class="col-xl-5">
            <div class="card">
                <div class="card-body" style="min-height: 435px;">

                    <h4 class="card-title">Vehicle Typewise Tickets</h4>

                    <div class="table-responsive">
                        <table class="table table-centered table-striped table-nowrap">
                            <thead>
                                <tr>
                                    <th class="text-center">Vehicle Type</th>
                                    <th class="text-center">No of Tickets</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if(count($vehicleCounts) > 0)
                                    @foreach ($vehicleCounts as $vehicleCount)
                                    <tr>
                                        <td class="text-center">{{$vehicleCount->vehicle_type_name}}</td>
                                        <td class="text-center">{{$vehicleCount->total}}</td>
                                    </tr>
                                    @endforeach
                                @else
                                <tr>
                                    <td colspan="4" class="text-center">No Data Found</td>
                                </tr>
                                @endif
                            </tbody>
                        </table>
                    </div>

                </div> <!-- end card-body-->
            </div> <!-- end card-->
        </div> <!-- end col -->
    </div>
    <!-- end row-->
@endsection
