<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Toll Ticket Preview</title>
    <style>
        body {
            width: 80mm;
            margin: 0;
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: 600;
            background-color: #f7f7f7;
            font-family: "Times New Roman", Times, serif;
        }
        .ticket {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 10px auto;
            padding: 15px;
            text-align: center;
        }
        .ticket_container{
            border: 2px solid #000000;
            padding: 10px;
            border-radius: 4px
        }
        .ticket h3 {
            margin: 0;
            font-size: 13px;
            color: #000000;
        }
        .ticket p {
            margin: 5px 0;
            font-size: 14px;
            color: #000000;
        }
        .divider {
            border-top: 1px dashed #000000;
            margin: 15px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 10px 0;
        }
        th, td {
            text-align: left;
            padding: 5px;
            font-size: 13px;
            color: #000000;
        }
        th {
            text-align: right;
            font-weight: bold;
        }
        td {
            text-align: left;
        }
        .no-print {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 8px 15px;
            font-size: 14px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        @media print {
            body {
                margin: 0;
                padding: 0;
                @if($generalInfo->ticket_width)
                width: {{$generalInfo->ticket_width}}mm;
                @else
                width: 80mm;
                @endif
                font-size: 12px;
                background-color: #fff; /* Remove background colors */
            }
            .ticket {
                width: 100%;
                padding: 10px;
                box-shadow: none;
                border: none;
            }
            .ticket h3 {
                font-size: 13px;
            }
            .ticket p {
                margin: 3px 0;
                line-height: 1.2;
            }
            th, td {
                padding: 4px;
            }
            .no-print {
                display: none;
            }
        }
    </style>
</head>
    <div class="ticket">
        <div class="ticket_container">
            <h3>{{$generalInfo->ticket_header}}</h3>
            <p style="margin: 0px; font-size: 16px">{{$generalInfo->company_name}}</p>

            <div class="divider" style="margin: 4px 0px"></div>
            <h3>{{$generalInfo->ticket_title}}</h3>
            <div class="divider" style="margin: 4px 0px; margin-bottom: 15px;"></div>

            {{-- <p style="margin: 0px; font-size: 16px">Date: {{$ticketInfo->created_at}}</p> --}}


            <table border="0" style="margin: 4px 0;" cellpadding="0" cellspacing="0">
                <tr>
                    <th style="text-align: left; padding: 2px; font-size: 14px; width: 40%;">Ticket No </th>
                    <td style="text-align: left; padding: 2px; font-size: 14px;">: {{$ticketInfo->ticket_no}}</td>
                </tr>
                <tr>
                    <th style="text-align: left; padding: 2px; font-size: 14px; width: 40%;">DateTime </th>
                    <td style="text-align: left; padding: 2px; font-size: 14px;">: {{date("Y-m-d h:i a", strtotime($ticketInfo->created_at))}}</td>
                </tr>
                <tr>
                    <th style="text-align: left; padding: 2px; font-size: 14px; width: 40%;">Terminal </th>
                    <td style="text-align: left; padding: 2px; font-size: 14px;">: {{$ticketInfo->terminal_name}}</td>
                </tr>
                <tr>
                    <th style="text-align: left; padding: 2px; font-size: 14px; width: 40%;">Vehicle </th>
                    <td style="text-align: left; padding: 2px; font-size: 12px;">: {{$ticketInfo->vehicle_type_name}}</td>
                </tr>
                <tr>
                    <th style="text-align: left; padding: 2px; font-size: 14px;">Fee </th>
                    <td style="text-align: left; padding: 2px; font-size: 14px;">: {{$ticketInfo->ticket_price}}/=</td>
                </tr>
                <tr>
                    <th style="text-align: left; padding: 2px; font-size: 14px;">Payment </th>
                    <td style="text-align: left; padding: 2px; font-size: 14px;">:
                        @if($ticketInfo->payment_method == 1)
                            Cash
                        @elseif($ticketInfo->payment_method == 2)
                            bKash
                        @elseif($ticketInfo->payment_method == 3)
                            Nagad
                        @elseif($ticketInfo->payment_method == 4)
                            Card
                        @else
                            N/A
                        @endif
                    </td>
                </tr>
            </table>

            <p style="margin: 0px; font-size: 14px; margin-top: 16px;">Have a Safe Journey</p>
        </div>
    </div>

    <!-- Go Back Button -->
    <div class="no-print">
        <a href="{{ url('create/toll/ticket') }}" class="btn">Go Back</a>
    </div>

    <script>
        window.onload = function() {
            window.print(); // Trigger print dialog
        };
    </script>
</body>
</html>
