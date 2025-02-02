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
                width: 80mm;
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
    <div class="ticket" style="background: {{$vehicleTypeInfo->color_code}}">
        <div class="ticket_container">
            <h3>{{$generalInfo->ticket_header}}</h3>
            <p style="margin: 0px; font-size: 16px">{{$generalInfo->company_name}}</p>

            <div class="divider" style="margin: 4px 0px"></div>
            <h3>{{$generalInfo->ticket_title}}</h3>
            <div class="divider" style="margin: 4px 0px"></div>

            <p style="margin: 0px; font-size: 16px">Ticket No: {{$ticketInfo->ticket_no}}</p>
            <p style="margin: 0px; font-size: 16px">Date: {{$ticketInfo->created_at}}</p>

            <div class="divider" style="margin: 4px 0px"></div>



            <table border="0" style="margin: 4px 0;" cellpadding="0" cellspacing="0">
                <tr>
                    <th style="text-align: left; padding: 2px; font-size: 14px;">Driver Contact</th>
                    <td style="text-align: right; padding: 2px; font-size: 14px;">@if($ticketInfo->driver_contact){{$ticketInfo->driver_contact}}@else N/A @endif</td>
                </tr>
                <tr>
                    <th style="text-align: left; padding: 2px; font-size: 14px;">Vehicle Reg. No</th>
                    <td style="text-align: right; padding: 2px; font-size: 14px;">@if($ticketInfo->vehicle_reg_no){{$ticketInfo->vehicle_reg_no}}@else N/A @endif</td>
                </tr>
            </table>

            <p style="margin: 0px; font-size: 18px; margin-top: 16px; border: 2px solid black; display: inline-block; padding: 1px 10px; border-radius: 4px;">{{$ticketInfo->ticket_price}}/=</p>
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
