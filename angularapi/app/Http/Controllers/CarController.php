<?php

namespace App\Http\Controllers;

use App\Models\Car;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use App\Helpers\APIHelpers;
use Illuminate\Support\Facades\Log;

class CarController extends Controller
{

    /** 
     * Funkcja pobierająca wszystkie samochody.
     * @return JsonResponse
     */
    public function getCars(): JsonResponse
    {
        try {
            $users = DB::select('SELECT cars.id AS car_id, cars.user_id, cars.brand, cars.model, cars.year_of_premiere, users.*, cities.name as city FROM `cars` JOIN `users` ON users.id = cars.user_id LEFT JOIN `cities` ON cities.id = cars.city_id');

            $users = collect($users)
            ->map(function ($groupFirst) {

                return [
                    'id' => $groupFirst->car_id,
                    'brand' => $groupFirst->brand,
                    'model' => $groupFirst->model,
                    'year_of_premiere' => $groupFirst->year_of_premiere,
                    'created_at' => $groupFirst->created_at,
                    'updated_at' => $groupFirst->updated_at,
                    'user' => [
                                'id' => $groupFirst->id,
                                'name' => $groupFirst->name,
                                'username' => $groupFirst->username,
                                'email' => $groupFirst->email,
                                'phone' => $groupFirst->phone,
                                'created_at' => $groupFirst->created_at,
                                'updated_at' => $groupFirst->updated_at,
                    ],
                    'city' => $groupFirst->city
                    
                ];
            })->values()->toArray();
            $response = APIHelpers::apiResponse(false, 200, 'Data fetched successfully', $users);
            return response()->json($response, 200);
        } catch (\Throwable $e) {
            $code = uniqid();
            Log::error('#' . $code . $e->getMessage(), [$e->getTraceAsString(), $e->getCode()]);
            $response = APIHelpers::apiResponse(true, 400, 'Data fetching failed - ' . $code, null);
            return response()->json($response, 400);
        }

    }

    /** 
     * Funkcja zapisująca samochód użytkownika.
     * @param Request $request
     * @return JsonResponse
     */
    public function storeCar(Request $request) {

        try {
            $car = new Car;
            $car->user_id = $request->user_id;
            $car->brand = $request->brand;
            $car->model = $request->model;
            $car->year_of_premiere = $request->year_of_premiere;
            $car->city_id = $request->city_id;
            $car->save();
            $response = APIHelpers::apiResponse(false, 200, 'Data stored successfully', null);
            return response()->json($response, 200);

        } catch (\Throwable $e) {
            $code = uniqid();
            Log::error('#' . $code . $e->getMessage(), [$e->getTraceAsString(), $e->getCode()]);
            $response = APIHelpers::apiResponse(true, 400, 'Storing of data failed - ' . $code, null);
            return response()->json($response, 400);
        }

    }

}
