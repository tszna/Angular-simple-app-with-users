<?php

namespace Database\Seeders;

use App\Models\City;
use App\Models\Country;
use App\Models\Car;
use Illuminate\Database\Seeder;

class CountrySeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        Country::factory()->count(10)->create();
        City::factory()->count(200)->create();
        Car::factory()->count(200)->create();
    }
}
