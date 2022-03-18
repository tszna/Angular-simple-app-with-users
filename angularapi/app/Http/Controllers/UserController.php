<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Helpers\APIHelpers;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\Auth;

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
     * Funkcja pobierająca wszystkich użytkowników z limitami.
     * @return JsonResponse
     */
    public function getUsers($page, $limit)
    {
        try {
            $users = User::query()
                ->offset($page * $limit)
                ->limit($limit)
                ->get();
        
            $response = APIHelpers::apiResponse(false, 200, 'Data fetched successfully', ['users' => $users, 'pages' => ceil(User::query()->count() / $limit)]);
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

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function login(Request $request)
    {
        /** @var User $user */
        $user = User::query()
            ->where('email', '=', $request->get('email'))
            ->first();

        if (!$user) {
            throw new HttpResponseException(
                response()->json([
                    'message' => 'wrong email',
                ], JsonResponse::HTTP_UNAUTHORIZED)
            );
        }

        $userHasValidPassword = Hash::check($request->get('password'), $user->password);

        if (!$userHasValidPassword) {
            throw new HttpResponseException(
                response()->json([
                    'message' => 'wrong password'
                ], JsonResponse::HTTP_UNAUTHORIZED)
            );
        }

        $token = $user->createToken('my-app-token')->plainTextToken;

        return response()->json([
            'token' => $token
        ]);
    }

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function register(Request $request): JsonResponse
    {
        $isPasswordSame = $request->get('password') === $request->get('password_repeat');

        if (!$isPasswordSame) {
            throw new HttpResponseException(
                response()->json([
                    'message' => 'password and password-repeat are not the same'
                ], JsonResponse::HTTP_UNAUTHORIZED)
            );
        }

        $user = User::create([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'password' => Hash::make($request->get('password')),
        ]);
       
        $token = $user->createToken('API Token')->plainTextToken;

        return response()->json([
            'registerInfo' => 'successfull register',
            'token' => $token
        ]);
    }

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function logout(Request $request)
    {
        auth()->user()->tokens()->delete();
        
        return response()->json([
            'message' => 'logged_out',
        ]);
    }

}
