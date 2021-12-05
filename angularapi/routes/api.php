<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CarController;

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

Route::get('/user', [UserController::class, 'getAllUsers']);
Route::delete('/user/{user}', [UserController::class, 'deleteUser']);
Route::delete('/users', [UserController::class, 'deleteManyUsers']);
Route::put('/update', [UserController::class, 'updateUser']);
Route::get('/car', [CarController::class, 'getCars']);
Route::post('/car', [CarController::class, 'storeCar']);
