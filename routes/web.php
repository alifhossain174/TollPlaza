<?php

use App\Http\Controllers\CkeditorController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\GeneralInfoController;
use App\Http\Controllers\BackupController;
use App\Http\Controllers\PermissionRoutesController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\UserRoleController;
use App\Http\Controllers\VehicleTypeController;
use App\Http\Controllers\TerminalController;
use App\Http\Controllers\TollTicketController;
use Illuminate\Support\Facades\Artisan;
use App\Http\Middleware\CheckUserType;
use App\Http\Middleware\DemoMode;
use Illuminate\Support\Facades\Auth;

Route::get('/', function () {
    return redirect('/login');
});

Route::get('/config-clear', function () {
    // Artisan::call('cache:clear');
    // Artisan::call('config:clear');
    // Artisan::call('view:clear');
    // Artisan::call('route:clear');

    // Artisan::call('config:cache');
    // Artisan::call('route:cache');
    // Artisan::call('view:cache');
    // Artisan::call('key:generate');
    return "Cleared!";
});

Route::get('/storage-link', function () {
    echo $_SERVER['DOCUMENT_ROOT'];
    exit();
    // $target = '/home/public_html/storage/app/public';
    // $shortcut = '/home/public_html/public/storage';
    // symlink($target, $shortcut);
    // return "Storage link!";
});

// Auth::routes();
Auth::routes([
    'login' => true,
    'register' => false, // Registration Routes...
    'reset' => false, // Password Reset Routes...
    'verify' => false, // Email Verification Routes...
]);

Route::middleware([CheckUserType::class, DemoMode::class])->group(function(){
    Route::get('/home', [HomeController::class, 'index'])->name('home');
    Route::get('/clear/cache', [HomeController::class, 'clearCache'])->name('ClearCache');
    Route::get('/change/password/page', [HomeController::class, 'changePasswordPage'])->name('changePasswordPage');
    Route::post('/change/password', [HomeController::class, 'changePassword'])->name('changePassword');
    Route::get('ckeditor', [CkeditorController::class, 'index']);
    Route::post('ckeditor/upload', [CkeditorController::class, 'upload'])->name('ckeditor.upload');
});


// file manager routes start
Route::get('/file-manager', function () {
    return view('backend.file_manager');
})->middleware(['auth']);

Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {

    \UniSharp\LaravelFilemanager\Lfm::routes();
    // this lfm.php and the view files has been modified to allow delete/rename/move action only for admin

    // replace this function inside the vendor/unisharp/laravel-filemanager/src/lfm.php if move is not working
    // public function translateFromUtf8($input)
    // {
    //     $rInput = [];
    //     if ($this->isRunningOnWindows()) {
    //         if (is_array($input)) {
    //             foreach ($input as $k => $i) {
    //                 $rInput[] = iconv('UTF-8', mb_detect_encoding($i), $i);
    //             }
    //         } else {
    //             $rInput = $input;
    //         }
    //     } else {
    //         $rInput = $input;
    //     }
    //     return $rInput;
    // }

});
// file manager routes end


Route::group(['middleware' => ['auth', 'CheckUserType', 'DemoMode']], function () {

    // vehicle Type
    Route::get('/create/vehicle/type', [VehicleTypeController::class, 'createVehicleType'])->name('CreateVehicleType');
    Route::post('/save/vehicle/type', [VehicleTypeController::class, 'saveVehicleType'])->name('SaveVehicleType');
    Route::get('/view/vehicle/types', [VehicleTypeController::class, 'viewVehicleTypes'])->name('ViewVehicleTypes');
    Route::get('/delete/vehicle/type/{id}', [VehicleTypeController::class, 'deleteVehicleType'])->name('DeleteVehicleType');
    Route::get('/edit/vehicle/type/{id}', [VehicleTypeController::class, 'editVehicleType'])->name('EditVehicleType');
    Route::post('/update/vehicle/type', [VehicleTypeController::class, 'updateVehicleType'])->name('UpdateVehicleType');

    // Terminal
    Route::get('/create/terminal', [TerminalController::class, 'createTerminal'])->name('CreateTerminal');
    Route::post('/save/terminal', [TerminalController::class, 'saveTerminal'])->name('SaveTerminal');
    Route::get('/view/terminals', [TerminalController::class, 'viewTerminals'])->name('ViewTerminals');
    Route::get('/delete/terminal/{id}', [TerminalController::class, 'deleteTerminal'])->name('DeleteTerminal');
    Route::get('/edit/terminal/{id}', [TerminalController::class, 'editTerminal'])->name('EditTerminal');
    Route::post('/update/terminal', [TerminalController::class, 'updateTerminal'])->name('UpdateTerminal');

    // Toll Ticket
    Route::get('/create/toll/ticket', [TollTicketController::class, 'createTollTicket'])->name('CreateTollTicket');

    // customers and system users routes
    Route::get('/view/all/customers', [UserController::class, 'viewAllCustomers'])->name('ViewAllCustomers');
    Route::get('/view/system/users', [UserController::class, 'viewAllSystemUsers'])->name('ViewAllSystemUsers');
    Route::get('/add/new/system/user', [UserController::class, 'addNewSystemUsers'])->name('AddNewSystemUsers');
    Route::post('/create/system/user', [UserController::class, 'createSystemUsers'])->name('CreateSystemUsers');
    Route::get('/edit/system/user/{id}', [UserController::class, 'editSystemUser'])->name('EditSystemUser');
    Route::get('/delete/system/user/{id}', [UserController::class, 'deleteSystemUser'])->name('DeleteSystemUser');
    Route::post('/update/system/user', [UserController::class, 'updateSystemUser'])->name('UpdateSystemUser');
    Route::get('make/user/superadmin/{id}', [UserController::class, 'makeSuperAdmin'])->name('MakeSuperAdmin');
    Route::get('revoke/user/superadmin/{id}', [UserController::class, 'revokeSuperAdmin'])->name('RevokeSuperAdmin');
    Route::get('/change/user/status/{id}', [UserController::class, 'changeUserStatus'])->name('ChangeUserStatus');
    Route::get('/delete/customer/{id}', [UserController::class, 'deleteCustomer'])->name('DeleteCustomer');


    // general info routes
    Route::get('/general/info', [GeneralInfoController::class, 'generalInfo'])->name('GeneralInfo');
    Route::post('/update/general/info', [GeneralInfoController::class, 'updateGeneralInfo'])->name('UpdateGeneralInfo');


    // backup download
    Route::get('/download/database/backup', [BackupController::class, 'downloadDBBackup'])->name('DownloadDBBackup');
    Route::get('/download/product/files/backup', [BackupController::class, 'downloadProductFilesBackup'])->name('DownloadProductFilesBackup');
    Route::get('/download/user/files/backup', [BackupController::class, 'downloadUserFilesBackup'])->name('DownloadUserFilesBackup');
    Route::get('/download/banner/files/backup', [BackupController::class, 'downloadBannerFilesBackup'])->name('DownloadBannerFilesBackup');
    Route::get('/download/category/files/backup', [BackupController::class, 'downloadCategoryFilesBackup'])->name('DownloadCategoryFilesBackup');
    Route::get('/download/subcategory/files/backup', [BackupController::class, 'downloadSubcategoryFilesBackup'])->name('DownloadSubcategoryFilesBackup');
    Route::get('/download/flag/files/backup', [BackupController::class, 'downloadFlagFilesBackup'])->name('DownloadFlagFilesBackup');
    Route::get('/download/ticket/files/backup', [BackupController::class, 'downloadTicketFilesBackup'])->name('DownloadTicketFilesBackup');
    Route::get('/download/blog/files/backup', [BackupController::class, 'downloadBlogFilesBackup'])->name('DownloadBlogFilesBackup');
    Route::get('/download/other/files/backup', [BackupController::class, 'downloadOtherFilesBackup'])->name('DownloadOtherFilesBackup');


    // generate report
    Route::get('sales/report', [ReportController::class, 'salesReport'])->name('SalesReport');
    Route::post('generate/sales/report', [ReportController::class, 'generateSalesReport'])->name('GenerateSalesReport');


    // user role permission routes
    Route::get('/view/permission/routes', [PermissionRoutesController::class, 'viewAllPermissionRoutes'])->name('ViewAllPermissionRoutes');
    Route::get('/regenerate/permission/routes', [PermissionRoutesController::class, 'regeneratePermissionRoutes'])->name('RegeneratePermissionRoutes');
    Route::get('/view/user/roles', [UserRoleController::class, 'viewAllUserRoles'])->name('ViewAllUserRoles');
    Route::get('/new/user/role', [UserRoleController::class, 'newUserRole'])->name('NewUserRole');
    Route::post('save/user/role', [UserRoleController::class, 'saveUserRole'])->name('SaveUserRole');
    Route::get('/delete/user/role/{id}', [UserRoleController::class, 'deleteUserRole'])->name('DeleteUserRole');
    Route::get('/edit/user/role/{id}', [UserRoleController::class, 'editUserRole'])->name('EditUserRole');
    Route::post('update/user/role', [UserRoleController::class, 'updateUserRole'])->name('UpdateUserRole');
    Route::get('/view/user/role/permission', [UserRoleController::class, 'viewUserRolePermission'])->name('ViewUserRolePermission');
    Route::get('/assign/role/permission/{id}', [UserRoleController::class, 'assignRolePermission'])->name('AssignRolePermission');
    Route::post('/save/assigned/role/permission', [UserRoleController::class, 'saveAssignedRolePermission'])->name('SaveAssignedRolePermission');

});
