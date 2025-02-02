<div class="card mb-1">
    <div class="card-header bg-white border-bottom-0 collapsed" style="cursor: pointer;" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" id="headingTwo">
        <a href="javascript:void(0)" style="position: relative" class="text-dark d-block font-size-15">
            <i class="feather-filter"></i> Advanced Filters for Toll Entries
            <span style="position: absolute; top: 50%; transform:translateY(-50%); right: 20px">&#8595;</span>
        </a>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
        <div class="card-body text-muted pt-1">
            <form>
                <div class="row">
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="ticket_no">Ticket No</label>
                            <input class="form-control" type="text" id="ticket_no" onkeyup="filterEntryData()" placeholder="12354698">
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="vehicle_type_id">Vehicle Type</label>
                            <select class="form-control" data-toggle="select2" onchange="filterEntryData()" id="vehicle_type_id">
                                <option value="">Select One</option>
                                @foreach ($vehicleTypes as $vehicleType)
                                <option value="{{$vehicleType->id}}">{{$vehicleType->type_name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="terminal_id">Select Terminal</label>
                            <select class="form-control" data-toggle="select2" onchange="filterEntryData()" id="terminal_id">
                                <option value="">Select One</option>
                                @foreach ($terminals as $terminal)
                                <option value="{{$terminal->id}}">{{$terminal->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="user_id">Select Operator</label>
                            <select class="form-control" data-toggle="select2" onchange="filterEntryData()" id="user_id">
                                <option value="">Select One</option>
                                @foreach ($users as $user)
                                <option value="{{$user->id}}">{{$user->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="driver_name">Driver Name</label>
                            <input class="form-control" type="text" onkeyup="filterEntryData()" id="driver_name" placeholder="Mr.">
                        </div>
                    </div>

                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="driver_contact">Driver Contact</label>
                            <input class="form-control" type="text" onkeyup="filterEntryData()" id="driver_contact" placeholder="ex. 017***">
                        </div>
                    </div>

                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="vehicle_reg_no">Vehicle Reg. No</label>
                            <input class="form-control" type="text" onkeyup="filterEntryData()" id="vehicle_reg_no" placeholder="ex. DM-KHA-65498">
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="form-group">
                            <label>Entry Date Range</label>
                            <div id="reportrange" class="form-control" data-toggle="date-picker-range" data-target-display="#selectedValue" data-cancel-class="btn-light" style="white-space: nowrap; overflow: hidden;">
                                <i class="mdi mdi-calendar"></i>&nbsp;
                                <span id="selectedValue"></span> <i class="mdi mdi-menu-down"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label class="d-block">&nbsp;</label>
                            <button type="button" class="btn btn-danger rounded" onclick="clearFilters()"><i class="feather-trash-2"></i> Clear Filters</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
