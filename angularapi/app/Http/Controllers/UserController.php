<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class UserController extends Controller
{

    /**
     * Funkcja pobierająca wszystkich użytkowników.
     * @return JsonResponse
     */
    public function getAllUsers(): JsonResponse
    {
        $users = User::all();
        return response()->json($users);

    }

    public function updateUser(Request $request) {

        $user = User::findOrFail($request->get('id'));
        $user->name = $request->name;
        $user->username = $request->username;
        $user->email = $request->email;
        $user->save();

        return response()->json('dane zaktualizowane');

    }

    /**
     * Funkcja usuwająca z bazy danych jednego użytkownika.
     * @param User $user
     * @return JsonResponse
     */
    public function deleteUser(User $user): JsonResponse
    {
        $user->delete();

        return response()->json(null);
    }

    public function deleteManyUsers(Request $request) {

        $data = $request->all();
        collect($data)->map(function ($uid) {
            return User::find($uid);
        })->each([$this, 'deleteUser']);

        return response()->json(null);
    }




}
