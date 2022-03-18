<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CarController;
use App\Http\Controllers\CountryController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::post('/logout', [UserController::class, 'logout']); 
    Route::get('/vote-for/{car}/{positive}', [CarController::class, 'voteFor']);   
    Route::get('/car', [CarController::class, 'getCars']);
});

Route::get('/user', [UserController::class, 'getAllUsers']);
Route::get('/user/load/{page}/{limit}', [UserController::class, 'getUsers']);
Route::delete('/user/{user}', [UserController::class, 'deleteUser']);
Route::delete('/users', [UserController::class, 'deleteManyUsers']);
Route::put('/update', [UserController::class, 'updateUser']);
Route::post('/car', [CarController::class, 'storeCar']);
Route::get('/country', [CountryController::class, 'getCountries']);
Route::get('/country/{country}/cities', [CountryController::class, 'getCities']);
Route::post('/register', [UserController::class, 'register']);
Route::post('/login', [UserController::class, 'login']);
