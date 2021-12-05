<?php

namespace App\Http\Controllers;

use App\Models\Car;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;

class CarController extends Controller
{

    /** 
     * Funkcja pobierająca wszystkich użytkowników.
     * @return JsonResponse
     */
    public function getCars(): JsonResponse
    {
         // $users = DB::table('cars')
        //     ->select(['cars.id as car_id', 'cars.brand', 'cars.model', 'cars.year_of_premiere', 'users.*'])
        //     ->join('users', 'users.id', '=', 'cars.user_id')
        //     ->get()
        //     ->groupBy(function ($entry) {
        //         return $entry->id;
        //     })
        //     ->map(function ($group) {
        //         $groupFirst = $group->first();

        //         return [
        //             'id' => $groupFirst->car_id,
        //             'brand' => $groupFirst->brand,
        //             'model' => $groupFirst->model,
        //             'year_of_premiere' => $groupFirst->year_of_premiere,
        //             'created_at' => $groupFirst->created_at,
        //             'updated_at' => $groupFirst->updated_at,
        //             'users' => $group->map(function ($user) {
        //                     return [
        //                         'id' => $user->id,
        //                         'name' => $user->name,
        //                         'username' => $user->username,
        //                         'email' => $user->email,
        //                         'phone' => $user->phone,
        //                         'created_at' => $user->created_at,
        //                         'updated_at' => $user->updated_at,];

        //             })
        //         ];
        //     })->values()->toArray();



        //poniżej to czysty sql, który można zastosować wszędzie, a nie tylko w symfony. Jest ot to samo co dostaniemy gdy użyjemy Car::query()->with('user')->get()
        $users = DB::select('SELECT cars.id AS car_id, cars.user_id, cars.brand, cars.model, cars.year_of_premiere, users.* FROM `cars` JOIN `users` ON users.id = cars.user_id');

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
                          ]

                
            ];
        })->values()->toArray();

        // $users = Car::query()->with('user')->get();


        return response()->json($users);

    }

    public function storeCar(Request $request) {

        $car = new Car;
        $car->user_id = $request->user_id;
        $car->brand = $request->brand;
        $car->model = $request->model;
        $car->year_of_premiere = $request->year_of_premiere;
        $car->save();

        return response()->json('Dodano dane');

    }

}
