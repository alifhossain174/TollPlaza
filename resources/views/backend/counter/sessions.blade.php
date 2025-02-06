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

    </style>
@endsection

@section('page_title')
    Counter Sessions
@endsection
@section('page_heading')
    View All Counter Sessions
@endsection

@section('content')
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

    <script type="text/javascript">
        var table = $(".data-table").DataTable({
            processing: true,
            serverSide: true,
            stateSave: true,
            ajax: "{{ url('view/counter/sessions') }}",
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
        });
    </script>

    {{-- js code for user crud --}}
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

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
