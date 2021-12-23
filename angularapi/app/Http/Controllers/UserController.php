<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Helpers\APIHelpers;
use Illuminate\Support\Facades\Log;

class UserController extends Controller
{

    /**
     * Funkcja pobierająca wszystkich użytkowników.
     * @return JsonResponse
     */
    public function getAllUsers(): JsonResponse
    {
        try {
            $users = User::all();
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
     * Funkcja aktualizująca dane użytkownika.
     * @param Request $request
     * @return JsonResponse
     */
    public function updateUser(Request $request) {

        try {
            /** @var User $user */
            $user = User::findOrFail($request->get('id'));
            $user->name = $request->name;
            $user->username = $request->username;
            $user->email = $request->email;
            $user->save();

            $response = APIHelpers::apiResponse(false, 200, 'Data updated successfully', null);
            return response()->json($response, 200);
        } catch (\Throwable $e) {
            $code = uniqid();
            Log::error('#' . $code . $e->getMessage(), [$e->getTraceAsString(), $e->getCode()]);
            $response = APIHelpers::apiResponse(true, 400, 'Data updated failed - ' . $code, null);
            return response()->json($response, 400);
        }

    }

    /**
     * Funkcja usuwająca z bazy danych jednego użytkownika.
     * @param User $user
     * @return JsonResponse
     */
    public function deleteUser(User $user): JsonResponse
    {
        try {
            $user->delete();
            $response = APIHelpers::apiResponse(false, 200, 'Data deleted successfully', null);
            return response()->json($response, 200);
        } catch (\Throwable $e) {
            $code = uniqid();
            Log::error('#' . $code . $e->getMessage(), [$e->getTraceAsString(), $e->getCode()]);
            $response = APIHelpers::apiResponse(true, 400, 'Data deleted failed - #' . $code, null);
            return response()->json($response, 400);
        }
    }

    /**
     * Funkcja usuwająca z bazy danych wielu użytkowników.
     * @param Request $request
     * @return JsonResponse
     */
    public function deleteManyUsers(Request $request) {

        try {
            $data = $request->all();
            collect($data)->map(function ($uid) {
                return User::find($uid);
            })->each([$this, 'deleteUser']);
            $response = APIHelpers::apiResponse(false, 200, 'Data deleted successfully', null);
            return response()->json($response, 200);
        } catch (\Throwable $e) {
            $code = uniqid();
            Log::error('#' . $code . $e->getMessage(), [$e->getTraceAsString(), $e->getCode()]);
            $response = APIHelpers::apiResponse(true, 400, 'Data deleted failed - #' . $code, null);
            return response()->json($response, 400);
        }
    }




}
