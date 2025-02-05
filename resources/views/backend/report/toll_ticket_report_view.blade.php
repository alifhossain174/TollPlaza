<div class="card" id="printableArea">
    <div class="card-body">

        <div class="row pb-3">
            <div class="col-lg-6">
                <h4 class="card-title">Toll Ticket Report From <b style="color: #225ba5">{{date("d M, Y",strtotime($startDate))}}</b> To <b style="color: #225ba5">{{date("d M, Y",strtotime($endDate))}}</b></h4>
            </div>
            <div class="col-lg-6 text-right">
                <a href="javascript:void(0);" onclick="printPageArea('printableArea')" class="hidden-print btn btn-sm btn-success rounded"><i class="fas fa-print"></i> Print Report</a>
            </div>
        </div>

        <table class="table table-striped table-bordered w-100 table-sm">
            <thead>
                <tr>
                    <th class="text-center">SL</th>
                    <th class="text-center">Ticket No</th>
                    <th class="text-center">Terminal</th>
                    <th class="text-center">Operator</th>
                    <th class="text-center">Vehicle Type</th>
                    <th class="text-center">Price</th>
                    <th class="text-center">Payment</th>
                    <th class="text-center">Driver Info</th>
                    <th class="text-center">Vehcile Reg. No</th>
                    <th class="text-center">Entered At</th>
                </tr>
            </thead>
            <tbody>

                @php
                    $sl = 1;
                    $grandTotal = 0;
                @endphp
                @foreach ($data as $item)
                @php
                    $grandTotal += $item->ticket_price;
                @endphp
                <tr>
                    <td class="text-center">{{$sl++}}</td>
                    <td class="text-center">{{$item->ticket_no}}</td>
                    <td class="text-center">{{$item->terminal_name}}</td>
                    <td class="text-center">{{$item->user_name}}</td>
                    <td class="text-center">{{$item->vehicle_type_name}}</td>
                    <td class="text-center">{{$item->ticket_price}}</td>
                    <td class="text-center">
                        @if($item->payment_method == 1)
                            Cash
                        @elseif($item->payment_method == 2)
                            bKash
                        @elseif($item->payment_method == 3)
                            Nagad
                        @elseif($item->payment_method == 4)
                            Card
                        @else
                            N/A
                        @endif
                    </td>
                    <td class="text-center">{{$item->vehicle_reg_no}}</td>
                    <td class="text-center">{{date("d-m-Y h:i a",strtotime($item->created_at))}}</td>
                </tr>
                @endforeach

                <tr>
                    <th colspan="5" class="text-right">Total : </th>
                    <th class="text-right">৳ {{number_format($grandTotal, 2)}}</th>
                    <th colspan="3" class="text-right"></th>
                </tr>
            </tbody>
        </table>

    </div>
</div>
