@extends('backend.master')

@section('page_title')
    Counters
@endsection
@section('page_heading')
    Counters of TollTicket
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-4">Checkin to your Counter</h4>

                    <div class="row">
                        @foreach ($counters as $counter)
                            @php
                                $counterSession = App\Models\CounterSession::where('counter_id', $counter->id)->orderBy('id', 'desc')->first();
                            @endphp
                            <div class="col-lg-4">
                                <div class="card">
                                    <div class="card-header font-weight-bolder">{{$counter->name}}</div>
                                    <div class="card-body">
                                        <table border="0" class="w-100">
                                            <tr>
                                                <td class="font-weight-bold">Terminal :</td>
                                                <td class="text-right">{{$counter->terminal_name}}</td>
                                            </tr>
                                            <tr>
                                                <td>Last Checkin :</td>
                                                <td class="text-right">
                                                    @if($counterSession && $counterSession->checkin_time)
                                                        {{date("d/m/y h:i a",strtotime($counterSession->checkin_time))}}
                                                    @else
                                                        N/A
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Last Checkout :</td>
                                                <td class="text-right">
                                                    @if($counterSession && $counterSession->checkout_time)
                                                        {{date("d/m/y h:i a",strtotime($counterSession->checkout_time))}}
                                                    @else
                                                        N/A
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Opening Balance :</td>
                                                <td class="text-right">
                                                    @if($counterSession)
                                                        {{$counterSession->opening_balance}}/=
                                                    @else
                                                        N/A
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Cash Short/Excess :</td>
                                                <td class="text-right">
                                                    @if($counterSession)
                                                        {{$counterSession->balance_missmatch}}/=
                                                    @else
                                                        N/A
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Closing Balance :</td>
                                                <td class="text-right">
                                                    @if($counterSession)
                                                        {{$counterSession->closing_balance}}/=
                                                    @else
                                                        N/A
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Last Operator :</td>
                                                <td class="text-right">
                                                    @if($counterSession)
                                                        {{$counterSession->user_name}}
                                                    @else
                                                        N/A
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font-weight-bold">Status :</td>
                                                <td class="text-right">
                                                    @if($counterSession && $counterSession->counter_status == 0)
                                                        <span class="badge badge-danger">Occupied</span>
                                                    @else
                                                        <span class="badge badge-success">Available</span>
                                                    @endif
                                                </td>
                                            </tr>
                                        </table>

                                        @if($counterSession && $counterSession->counter_status == 0 && $counterSession->user_id == Auth::user()->id)
                                        <button class="btn btn-sm btn-danger d-inline-block mt-3 font-weight-bold"><i class="fas fa-sign-in-alt"></i> Check Out</button>
                                        @elseif($counterSession && $counterSession->counter_status == 0 && $counterSession->user_id != Auth::user()->id)
                                        <button class="btn btn-sm btn-danger d-inline-block mt-3 font-weight-bold" disabled><i class="fas fa-sign-in-alt"></i> Occupied</button>
                                        @else
                                        @php
                                            $currentOpening = $counterSession ? $counterSession->closing_balance : 0;
                                        @endphp
                                        <button onclick="counterCheckIn({{$counter->id}},{{$currentOpening}})" class="btn btn-sm btn-success d-inline-block mt-3 font-weight-bold"><i class="fas fa-sign-in-alt"></i> Check In</button>
                                        @endif

                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="productForm" name="productForm2" class="form-horizontal">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bold">Counter Check In</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="checkin_counter_id" class="form-control">
                        <div class="form-group">
                            <label>Last Closing/Current Opening</label>
                            <input type="text" id="current_opening" class="form-control" readonly>
                        </div>
                        <div class="form-group">
                            <label>Balance Short/Excessive</label>
                            <input type="number" id="balance_missmatch" placeholder="e.g. +200/-500" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="submitCounterCheckIn" class="btn btn-success">Check In</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection

@section('footer_js')
    <script>
        function counterCheckIn(counterId, currentOpening){
            $('#productForm').trigger("reset");
            $('#exampleModal').modal('show');
            $("#checkin_counter_id").val(counterId);
            $("#current_opening").val(currentOpening);
        }

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#submitCounterCheckIn').click(function (e) {
            e.preventDefault();

            var formData = new FormData();
            formData.append("checkin_counter_id", $("#checkin_counter_id").val());
            formData.append("balance_missmatch", $("#balance_missmatch").val());

            $(this).html('Wait..');
            $.ajax({
                data: formData,
                url: "{{ url('submit/counter/checkin') }}",
                type: "POST",
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    toastr.success("Checked In", "Checkin Success");
                    $('#submitCounterCheckIn').html('Done');
                    $('#productForm').trigger("reset");
                    $('#exampleModal').modal('hide');
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
@endsection


