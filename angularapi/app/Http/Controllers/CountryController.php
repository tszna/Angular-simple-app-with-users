<?php

namespace App\Http\Controllers;

use App\Models\City;
use App\Models\Country;
use Illuminate\Http\JsonResponse;
use App\Helpers\APIHelpers;
use Illuminate\Support\Facades\Log;

class CountryController extends Controller
{

    /**
     * Funkcja pobierająca wszystkie państwa.
     * @return JsonResponse
     */
    public function getCountries(): JsonResponse
    {
        try {
            $countries = Country::all();
            $response = APIHelpers::apiResponse(false, 200, 'Data fetched successfully', $countries);
            return response()->json($response, 200);
        } catch (\Throwable $e) {
            $code = uniqid();
            Log::error('#' . $code . $e->getMessage(), [$e->getTraceAsString(), $e->getCode()]);
            $response = APIHelpers::apiResponse(true, 400, 'Data fetching failed - ' . $code, null);
            return response()->json($response, 400);
        }
    }

    /**
     * Funkcja pobierająca miasta na podstawie podanego w parametrze państwa.
     * @return JsonResponse
     */
    public function getCities(Country $country): JsonResponse
    {
        try {
            $cities = City::query()->where('country_id', $country->id)->get();
            $response = APIHelpers::apiResponse(false, 200, 'Data fetched successfully', $cities);
            return response()->json($response, 200);
        } catch (\Throwable $e) {
            $code = uniqid();
            Log::error('#' . $code . $e->getMessage(), [$e->getTraceAsString(), $e->getCode()]);
            $response = APIHelpers::apiResponse(true, 400, 'Data fetching failed - ' . $code, null);
            return response()->json($response, 400);
        }
    }
}
