@extends('backend.master')

@section('header_css')
    <link href="{{ url('dataTable') }}/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="{{ url('dataTable') }}/css/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link href="{{ url('assets') }}/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('dataTable') }}/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="{{ url('assets') }}/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('assets') }}/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet"/>
    <style>
        .select2-selection{
            height: 34px !important;
            border: 1px solid #ced4da !important;
        }
        .select2 {
            width: 100% !important;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button{
            padding: 0px;
            border-radius: 4px;
        }
        table.dataTable tbody td:nth-child(1){
            font-weight: 600;
        }
        table.dataTable tbody td{
            text-align: center !important;
        }
        tfoot {
            display: table-header-group !important;
        }
        tfoot th{
            text-align: center;
        }

        .dt-buttons{
            margin-left: 15px;
        }
        button.dt-button{
            padding: 0.3em 1em !important;
        }
        button.buttons-excel, button.buttons-excel:hover{
            background: #008000db !important;
            color: white !important;
            border: 1px solid #129912 !important;
            border-radius: 4px !important;
        }
        button.buttons-pdf, button.buttons-pdf:hover{
            background: #af0000de !important;
            color: white !important;
            border-radius: 4px !important;
            border-color: #ad0000 !important;
        }
        button.buttons-print, button.buttons-print:hover{
            background: #0087bee0 !important;
            color: white !important;
            border-radius: 4px !important;
            border-color: #007eb2 !important;
        }
    </style>
@endsection

@section('page_title')
    Counter Sessions
@endsection
@section('page_heading')
    View All Counter Sessions
@endsection

@section('content')

    @if(Auth::user()->user_type == 1)
    <div id="accordion">
        @include('backend.counter.filter_sessions')
    </div>
    @endif

    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Counter Sessions List</h4>
                    <div class="table-responsive">

                        <table class="table table-bordered mb-0 data-table">
                            <thead>
                                <tr>
                                    <th class="text-center">SL</th>
                                    <th class="text-center">Terminal</th>
                                    <th class="text-center">Counter</th>
                                    <th class="text-center">User</th>
                                    <th class="text-center">Checked In</th>
                                    <th class="text-center">Checked Out</th>
                                    <th class="text-center">Opening</th>
                                    <th class="text-center">Missmatch</th>
                                    <th class="text-center">Closing</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection


@section('footer_js')

    {{-- js code for data table --}}
    <script src="{{ url('dataTable') }}/js/jquery.validate.js"></script>
    <script src="{{ url('dataTable') }}/js/jquery.dataTables.min.js"></script>
    <script src="{{ url('dataTable') }}/js/dataTables.bootstrap4.min.js"></script>

    <script src="{{ url('assets') }}/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="{{ url('assets') }}/plugins/moment/moment.js"></script>
    <script src="{{ url('assets') }}/plugins/daterangepicker/daterangepicker.js"></script>

    <script src="{{ url('dataTable') }}/js/dataTables.buttons.min.js"></script>
    <script src="{{ url('dataTable') }}/js/jszip.min.js"></script>
    <script src="{{ url('dataTable') }}/js/pdfmake.min.js"></script>
    <script src="{{ url('dataTable') }}/js/vfs_fonts.js"></script>
    <script src="{{ url('dataTable') }}/js/buttons.html5.min.js"></script>
    <script src="{{ url('dataTable') }}/js/buttons.print.min.js"></script>

    <script src="{{ url('assets') }}/plugins/select2/select2.min.js"></script>

    <script type="text/javascript">

        $('[data-toggle="select2"]').select2();

        @if(Auth::user()->user_type == 1)
        // Date Range Picker
        var defaultOptions = {
            "cancelClass": "btn-light",
            "applyButtonClasses": "btn-success"
        };

        // // date pickers
        $('[data-toggle="daterangepicker"]').each(function (idx, obj) {
            var objOptions = $.extend({}, defaultOptions, $(obj).data());
            $(obj).daterangepicker(objOptions);
        });

        var start = moment().subtract(29, 'days');
        var end = moment();
        var defaultRangeOptions = {
            startDate: start,
            endDate: end,
            ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        };

        $('[data-toggle="date-picker-range"]').each(function (idx, obj) {
            var objOptions = $.extend({}, defaultRangeOptions, $(obj).data());
            var target = objOptions["targetDisplay"];
            //rendering
            $(obj).daterangepicker(objOptions, function(start, end) {
                if (target)
                    $(target).html(start.format('MMM D, YYYY') + ' - ' + end.format('MMM D, YYYY'));
            });
        });

        const targetNode = document.getElementById("selectedValue");
        const observer = new MutationObserver((mutationsList) => {
            for (const mutation of mutationsList) {
                if (mutation.type === "characterData" || mutation.type === "childList") {
                    filterData();
                }
            }
        });
        observer.observe(targetNode, { childList: true, characterData: true, subtree: true });

        @endif

        var table = $(".data-table").DataTable({
            processing: true,
            serverSide: true,
            stateSave: true,
            pageLength: 20,
            lengthMenu: [
                [20, 50, 100, 200, -1],
                [20, 50, 100, 200, "All"]
            ],
            ajax: {
                url: "{{ url('view/counter/sessions') }}",
                data: function(d) {
                    d.terminal_id = $("#terminal_id").val();
                    d.counter_id = $("#counter_id").val();
                    d.user_id = $("#user_id").val();
                    d.checkin_date_range = $("#selectedValue").text();
                }
            },
            columns: [
                {
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'terminal_name',
                    name: 'terminal_name'
                },
                {
                    data: 'counter_name',
                    name: 'counter_name'
                },
                {
                    data: 'user_name',
                    name: 'user_name'
                },
                {
                    data: 'checkin_time',
                    name: 'checkin_time'
                },
                {
                    data: 'checkout_time',
                    name: 'checkout_time'
                },
                {
                    data: 'opening_balance',
                    name: 'opening_balance'
                },
                {
                    data: 'balance_missmatch',
                    name: 'balance_missmatch'
                },
                {
                    data: 'closing_balance',
                    name: 'closing_balance'
                },
                {data: 'status', name: 'status'},
                {data: 'action', name: 'action', orderable: false, searchable: false},
            ],
            dom: 'lBfrtip', // Include 'l' for length changing input (Show Entries)
            buttons: [
                {
                    extend: 'excelHtml5',
                    title: 'Orders Data',
                    text: '<i class="far fa-file-excel"></i> Excel',
                    exportOptions: {
                        columns: ':visible' // Export only visible columns
                    }
                },
                {
                    extend: 'pdfHtml5',
                    title: 'Orders Data',
                    text: '<i class="far fa-file-pdf"></i> PDF',
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'print',
                    title: 'Orders Data',
                    text: '<i class="fas fa-print"></i> Print',
                    exportOptions: {
                        columns: ':visible'
                    }
                }
            ]
        });
    </script>

    {{-- js code for user crud --}}
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        function filterData(){
            table.draw(false);
        }

        function clearFilters(){
            $("#terminal_id").val("");
            $("#counter_id").val("");
            $("#user_id").val("");
            $("#selectedValue").text("");
            table.draw(false);
        }

        $('body').on('click', '.completeBtn', function () {
            var sessionSlug = $(this).data("id");
            if(confirm("Are You sure want to Complete !")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('complete/counter/session') }}"+'/'+sessionSlug,
                    success: function (data) {
                        table.draw(false);
                        toastr.success("Session has been Completed", "Completed Successfully");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            }
        });
    </script>
@endsection
