<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class Vote extends Pivot
{
    protected $table = 'votes';

    /**
     * The attributes that are mass assignable.
     *
     *
     */
    protected $fillable = [
        'user_id',
        'car_id',
        'is_positive',
    ];
}
