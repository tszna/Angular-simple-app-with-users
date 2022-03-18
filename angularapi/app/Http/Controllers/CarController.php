<?php

namespace App\Http\Controllers;

use App\Models\Car;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
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
            $carsById = Car::all()->load(['user', 'city', 'votes'])->toArray();
            $uid = auth()->user()->id;
            $userIsPaid = (int)auth()->user()->paid === 1;
            foreach($carsById as &$value) {
                $value['userCanVote'] = $value['user_id'] != $uid && !(collect($value['votes'])->pluck('user_id')->contains($uid)) && $userIsPaid;
            }
            $response = APIHelpers::apiResponse(false, 200, 'Data fetched successfully', array_values($carsById));
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

    public function voteFor(Car $car, int $positive)
    {
        /** @var User $user */
        $user = auth()->user();
        $user->votes()->attach($car, [
            'is_positive' => $positive,
        ]);

        return response()->json();
    }
}
