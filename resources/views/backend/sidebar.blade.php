<!-- Left Menu Start -->
<ul class="metismenu list-unstyled" id="side-menu">
    <li><a href="{{ url('/home') }}"><i class="feather-home"></i><span>Dashboard</span></a></li>

    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 5px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">System Config</li>
    <li><a href="{{ url('/general/info') }}"><i class="feather-settings"></i><span>General Info</span></a></li>
    <li><a href="{{ url('/file-manager') }}"><i class="far fa-folder-open"></i><span>File Manager</span></a></li>

    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 12px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">Toll Plaza Modules</li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="fas fa-shuttle-van"></i><span>Vehicle Type Config</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/create/vehicle/type') }}">Add Vehicle Type</a></li>
            <li><a href="{{ url('/view/vehicle/types') }}">View Vehicle Types</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="fas fa-charging-station"></i><span>Terminal Config</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/create/terminal') }}">Add New Terminal</a></li>
            <li><a href="{{ url('/view/terminals') }}">View All Terminals</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="fas fa-ticket-alt"></i><span>Toll Tickets</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/create/toll/ticket') }}">Create Toll Ticket</a></li>
            <li><a href="{{ url('/view/toll/tickets') }}">View All Tickets</a></li>
        </ul>
    </li>


    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 12px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">Report & Backup Modules</li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-printer"></i><span>Generate Report</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/sales/report') }}">Sales Report</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-download-cloud"></i><span>Download Backup</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/download/database/backup') }}">Database Backup</a></li>
            <li><a href="{{ url('/download/other/files/backup') }}">Other Images Backup</a></li>
        </ul>
    </li>

    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 5px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">User Role Permission</li>
    <li><a href="{{ url('/view/system/users') }}"><i class="fas fa-user-shield"></i><span>System Users</span></a></li>
    <li><a href="{{ url('/view/permission/routes') }}"><i class="feather-git-merge"></i><span>Permission Routes</span></a></li>
    <li><a href="{{ url('/view/user/roles') }}"><i class="feather-user-plus"></i><span>User Roles</span></a></li>
    <li><a href="{{ url('/view/user/role/permission') }}"><i class="mdi mdi-security"></i><span>Assign Role Permission</span></a></li>

    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 12px;">
    <li><a href="{{ url('/clear/cache') }}"><i class="feather-rotate-cw"></i><span>Clear Cache</span></a></li>
    <li><a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="feather-log-out"></i><span>Logout</span></a></li>

</ul>
