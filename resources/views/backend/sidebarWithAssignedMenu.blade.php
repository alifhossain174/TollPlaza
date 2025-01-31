<!-- Left Menu Start -->
<?php
    function checkAuth($routes){
        if(App\Models\UserRolePermission::where('user_id', Auth::user()->id)->where('route', 'like', '%'.$routes.'%')->exists()){
            return true;
        } else {
            return false;
        }
    }

    $backupModule = App\Models\UserRolePermission::where('user_id', Auth::user()->id)->where('route', 'like', '%backup%')->get();
    $reportModule = App\Models\UserRolePermission::where('user_id', Auth::user()->id)->where('route', 'like', '%sales/report%')->get();
?>


<ul class="metismenu list-unstyled" id="side-menu">
    <li class="menu-title">Menu</li>

    <li><a href="{{ url('/home') }}"><i class="feather-home"></i><span>Dashboard</span></a></li>

    @if(checkAuth("general/info") || checkAuth("file-manager"))
    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 5px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">System Config</li>
    @endif
    @if(checkAuth("general/info")) <li><a href="{{ url('/general/info') }}"><i class="feather-grid"></i><span>General Info</span></a></li> @endif
    @if(checkAuth("file-manager")) <li><a href="{{ url('/file-manager') }}"><i class="far fa-folder-open"></i><span>File Manager</span></a></li> @endif


    @if(count($configModule) > 0 || count($reportModule) > 0 || count($backupModule) > 0)
    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 12px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">E-commerce Modules</li>
    @endif

    @if ($reportModule && count($reportModule) > 0)
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-printer"></i><span>Generate Report</span></a>
        <ul class="sub-menu" aria-expanded="false">
            @if(checkAuth("sales/report")) <li><a href="{{ url('/sales/report') }}">Sales Report</a></li> @endif
        </ul>
    </li>
    @endif

    @if ($backupModule && count($backupModule) > 0)
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-download-cloud"></i><span>Download Backup</span></a>
        <ul class="sub-menu" aria-expanded="false">
            @if(checkAuth("download/database/backup")) <li><a href="{{ url('/download/database/backup') }}">Database Backup</a></li> @endif
            @if(checkAuth("download/other/files/backup")) <li><a href="{{ url('/download/other/files/backup') }}">Other Images Backup</a></li> @endif
        </ul>
    </li>
    @endif


    @if(checkAuth("view/permission/routes") || checkAuth("view/user/roles") || checkAuth("view/user/role/permission") || checkAuth("view/system/users"))
    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 5px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">User Role Permission</li>
    @endif

    @if(checkAuth("view/system/users")) <li><a href="{{ url('/view/system/users') }}"><i class="fas fa-user-shield"></i><span>System Users</span></a></li> @endif
    @if(checkAuth("view/permission/routes")) <li><a href="{{ url('/view/permission/routes') }}"><i class="feather-git-merge"></i><span>Permission Routes</span></a></li> @endif
    @if(checkAuth("view/user/roles")) <li><a href="{{ url('/view/user/roles') }}"><i class="feather-user-plus"></i><span>User Roles</span></a></li> @endif
    @if(checkAuth("view/user/role/permission")) <li><a href="{{ url('/view/user/role/permission') }}"><i class="mdi mdi-security"></i><span>Assign Role Permission</span></a></li> @endif

    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 12px;">
    @if(checkAuth("clear/cache")) <li><a href="{{ url('/clear/cache') }}"><i class="feather-rotate-cw"></i><span>Clear Cache</span></a></li> @endif
    <li><a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="feather-log-out"></i><span>Logout</span></a></li>

</ul>
