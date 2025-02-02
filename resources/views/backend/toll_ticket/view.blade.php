@extends('backend.master')

@section('header_css')
    <link href="{{ url('dataTable') }}/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="{{ url('dataTable') }}/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <style>
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
        img.gridProductImage{
            transition: all .1s linear;
        }
        img.gridProductImage:hover{
            scale: 2;
            cursor: pointer;
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
                                    <th class="text-center">Terminal</th>
                                    <th class="text-center">Operator</th>
                                    <th class="text-center">Vehicle Type</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-center">Driver Info</th>
                                    <th class="text-center">Reg. No</th>
                                    <th class="text-center">Entered At</th>
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

    <script type="text/javascript">
        var table = $(".data-table").DataTable({
            processing: true,
            serverSide: true,
            stateSave: true,
            ajax: "{{ url('view/toll/tickets') }}",
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
                    data: 'terminal_name',
                    name: 'terminal_name'
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
                    data: 'driver_name',
                    name: 'driver_name'
                },
                {
                    data: 'vehicle_reg_no',
                    name: 'vehicle_reg_no'
                },
                {
                    data: 'created_at',
                    name: 'created_at'
                },
                {data: 'action', name: 'action', orderable: false, searchable: false},
            ],
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
