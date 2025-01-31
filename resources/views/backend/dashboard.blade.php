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
        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">No Of Orders (Monthly)</h6>
                            <span class="h3 mb-0"> 10 </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline1" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-shopping-cart" style="color: #0074E4; background: #0074E42E;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->

        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Total Revenue (Monthly)</h6>
                            <span class="h3 mb-0"> ৳ 2500 </span>
                        </div>
                    </div> <!-- end row -->
                    <div id="sparkline2" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-trending-up" style="color: #17263A; background: #17263A3D;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->

        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Todays Order (Daily)</h6>
                            <span class="h3 mb-0"> 25 </span>
                            <span class="h3 mb-0"> <a target="_blank" href="{{url('view/pending/orders')}}" style="height: 20px; line-height: 10px; margin-top: -4px;" class="btn btn-sm btn-success rounded">View All</a> </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline3" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-package" style="color: #c28a00; background: #daa5202e;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->

        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Registered Users (Monthly)</h6>
                            <span class="h3 mb-0"> 125 </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline4" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-users" style="color: #a60000; background: #a6000026;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->
    </div>
    <!-- end row-->

    <div class="row">
        <div class="col-xl-4 col-lg-5">
            <div class="card">
                <div class="card-body">

                    <h4 class="card-title">Best Selling Products (6 months)</h4>
                    <p class="card-subtitle mb-4">From date of {{date("jS M, Y")}} to continue</p>

                    <div id="morris-donut-example" class="morris-chart"></div>

                </div> <!-- end card-body-->
            </div> <!-- end card-->

        </div> <!-- end col-->

        <div class="col-xl-8 col-lg-7">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Sales Analytics (Successfull & Failed Order Ratio)</h4>
                    <p class="card-subtitle mb-4" style="color: trans">From Last Few Months</p>
                    <div id="morris-bar-example" class="morris-chart"></div>
                </div>
            </div>
        </div> <!-- end col-->
    </div>
    <!-- end row-->

    <div class="row">
        <div class="col-xl-6">
            <div class="card">
                <div class="card-body" style="min-height: 435px;">

                    <h4 class="card-title">Recent Customers</h4>

                    <div class="table-responsive">
                        <table class="table table-centered table-striped table-nowrap">
                            <thead>
                                <tr>
                                    <th>Customer</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Location</th>
                                    <th>Create Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="5" class="text-center">No Customers Found</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div> <!-- end card-body-->
            </div> <!-- end card-->
        </div> <!-- end col -->

        <div class="col-xl-6">
            <div class="card">
                <div class="card-body" style="min-height: 435px;">

                    <h4 class="card-title">Account Transactions</h4>

                    <div class="table-responsive">
                        <table class="table table-centered table-striped table-nowrap">
                            <thead>
                                <tr>
                                    <th>TRX ID</th>
                                    <th>Amount</th>
                                    <th>Card Type/Brand</th>
                                    <th>Payment Through</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="4" class="text-center">No Transaction Found</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div> <!-- end card-body-->
            </div> <!-- end card-->
        </div> <!-- end col -->
    </div>
    <!-- end row-->
@endsection

@section('footer_js')
    <script>
        $(document).ready(function() {

            var DrawSparkline = function() {
                $('#sparkline1').sparkline([10,9,8,7,6,5,4,3,2
                ], {
                    type: 'line',
                    width: "100%",
                    height: '50',
                    chartRangeMax: 35,
                    lineColor: '#2e7ce4',
                    fillColor: 'rgba(46, 124, 228, 0.3)',
                    highlightLineColor: 'rgba(0,0,0,.1)',
                    highlightSpotColor: 'rgba(0,0,0,.2)',
                    maxSpotColor: false,
                    minSpotColor: false,
                    spotColor: false,
                    lineWidth: 1
                });

                $('#sparkline2').sparkline([10,9,8,7,6,5,4,3,2
                ], {
                    type: 'line',
                    width: "100%",
                    height: '50',
                    chartRangeMax: 35,
                    lineColor: '#627898',
                    fillColor: 'rgba(98, 120, 152, 0.3)',
                    highlightLineColor: 'rgba(0,0,0,.1)',
                    highlightSpotColor: 'rgba(0,0,0,.2)',
                    maxSpotColor: false,
                    minSpotColor: false,
                    spotColor: false,
                    lineWidth: 1
                });

                $('#sparkline3').sparkline([10,9,8,7,6,5,4,3,2
                ], {
                    type: 'line',
                    width: "100%",
                    height: '50',
                    chartRangeMax: 35,
                    lineColor: '#f1bf43',
                    fillColor: 'rgba(241, 191, 67, 0.3)',
                    highlightLineColor: 'rgba(0,0,0,.1)',
                    highlightSpotColor: 'rgba(0,0,0,.2)',
                    maxSpotColor: false,
                    minSpotColor: false,
                    spotColor: false,
                    lineWidth: 1
                });

                $('#sparkline4').sparkline([10,9,8,7,6,5,4,3,2
                ], {
                    type: 'line',
                    width: "100%",
                    height: '50',
                    chartRangeMax: 35,
                    lineColor: '#df3554',
                    fillColor: 'rgba(223, 53, 84, 0.3)',
                    highlightLineColor: 'rgba(0,0,0,.1)',
                    highlightSpotColor: 'rgba(0,0,0,.2)',
                    maxSpotColor: false,
                    minSpotColor: false,
                    spotColor: false,
                    lineWidth: 1
                });
            };

            DrawSparkline();

            var resizeChart;

            $(window).resize(function(e) {
                clearTimeout(resizeChart);
                resizeChart = setTimeout(function() {
                    DrawSparkline();
                }, 300);
            });
        });


        $(function() {
            'use strict';
            if ($("#morris-bar-example").length) {
                Morris.Bar({
                    element: 'morris-bar-example',
                    barColors: ['#00C2B2', '#DF3554'],
                    data: [
                        {
                            y: '10',
                            a: 2,
                            b: 8
                        }
                        {
                            y: '10',
                            a: 2,
                            b: 8
                        }
                        {
                            y: '10',
                            a: 2,
                            b: 8
                        }
                        {
                            y: '10',
                            a: 2,
                            b: 8
                        }
                        {
                            y: '10',
                            a: 2,
                            b: 8
                        }
                        {
                            y: '10',
                            a: 2,
                            b: 8
                        }
                        {
                            y: '10',
                            a: 2,
                            b: 8
                        }
                        {
                            y: '10',
                            a: 2,
                            b: 8
                        }
                        {
                            y: '10',
                            a: 2,
                            b: 8
                        }
                        {
                            y: '10',
                            a: 2,
                            b: 8
                        }
                    ],
                    xkey: 'y',
                    ykeys: ['a', 'b'],
                    hideHover: 'auto',
                    gridLineColor: '#eef0f2',
                    resize: true,
                    barSizeRatio: 0.4,
                    labels: ['Successfull Orders', 'Failed Orders']
                });
            }

            if ($("#morris-donut-example").length) {
                Morris.Donut({
                    element: 'morris-donut-example',
                    resize: true,
                    colors: ['#2e7ce4', '#00c2b2', '#df3554'],
                    data: [{
                            label: "Prod-1",
                            value: 100
                        },
                        {
                            label: 'Prod-2',
                            value: 120
                        },
                        {
                            label: 'Prod-3',
                            value: 75
                        }
                    ]
                });
            }

        });
    </script>
@endsection
