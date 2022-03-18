<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class CarFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'user_id' => $this->faker->numberBetween(1, 20),
            'city_id' => $this->faker->numberBetween(1, 200),
            'brand' => $this->faker->userName,
            'model' => $this->faker->domainWord,
            'year_of_premiere' => $this->faker->date,
        ];
    }
}