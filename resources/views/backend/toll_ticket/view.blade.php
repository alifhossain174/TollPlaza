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
    Toll Ticket
@endsection
@section('page_heading')
    View All Toll Tickets
@endsection

@section('content')

    @if(Auth::user()->user_type == 1)
    <div id="accordion">
        @include('backend.toll_ticket.filter_entries')
    </div>
    @endif

    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Toll Tickets List</h4>
                    <div class="table-responsive">

                        <label id="customFilter">
                            <a href="{{url('create/toll/ticket')}}" class="btn btn-success btn-sm" style="margin-left: 5px"><b><i class="fas fa-plus"></i> Create New Ticket</b></a>
                        </label>

                        <table class="table table-bordered mb-0 data-table">
                            <thead>
                                <tr>
                                    <th class="text-center">SL</th>
                                    <th class="text-center">Ticket No</th>
                                    <th class="text-center">Entry Time</th>
                                    <th class="text-center">Terminal</th>
                                    <th class="text-center">Counter</th>
                                    <th class="text-center">Operator</th>
                                    <th class="text-center">Vehicle Type</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-center">Reg. No</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="7"></th>
                                    <th></th>
                                    <th colspan="2"></th>
                                </tr>
                            </tfoot>
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
                    filterEntryData();
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
            // ajax: "{{ url('view/toll/tickets') }}",
            ajax: {
                url: "{{ url('view/toll/tickets') }}",
                data: function(d) {
                    d.ticket_no = $("#ticket_no").val() || "";
                    d.vehicle_type_id = $("#vehicle_type_id").val();
                    d.terminal_id = $("#terminal_id").val();
                    d.counter_id = $("#counter_id").val();
                    d.user_id = $("#user_id").val();
                    d.vehicle_reg_no = $("#vehicle_reg_no").val();
                    d.payment_method = $("#payment_method").val();
                    d.purchase_date_range = $("#selectedValue").text();
                }
            },
            columns: [
                {
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'ticket_no',
                    name: 'ticket_no'
                },
                {
                    data: 'created_at',
                    name: 'created_at'
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
                    data: 'vehicle_type_name',
                    name: 'vehicle_type_name'
                },
                {
                    data: 'ticket_price',
                    name: 'ticket_price'
                },
                {
                    data: 'vehicle_reg_no',
                    name: 'vehicle_reg_no'
                },
                {data: 'action', name: 'action', orderable: false, searchable: false},
            ],
            footerCallback: function(row, data, start, end, display) {
                var api = this.api();
                var totalFee = api.column(7, { page: 'current' }).data().reduce(function(a, b) {
                    return parseFloat(a) + parseFloat(b);
                }, 0);
                $(api.column(7).footer()).html("৳ "+totalFee);
            },
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

        $(".dataTables_filter").append($("#customFilter"));
    </script>

    {{-- js code for user crud --}}
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        function filterEntryData(){
            table.draw(false);
        }

        function clearFilters(){
            $("#ticket_no").val("");
            $("#terminal_id").val("");
            $("#counter_id").val("");
            $("#vehicle_type_id").val("");
            $("#user_id").val("");
            $("#vehicle_reg_no").val("");
            $("#payment_method").val("");
            $("#selectedValue").text("");
            table.draw(false);
        }

        $('body').on('click', '.deleteBtn', function () {
            var tollTicketId = $(this).data("id");
            if(confirm("Are You sure want to delete !")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('delete/toll/ticket') }}"+'/'+tollTicketId,
                    success: function (data) {
                        table.draw(false);
                        toastr.error("Toll Ticket has been Deleted", "Deleted Successfully");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            }
        });
    </script>
@endsection
