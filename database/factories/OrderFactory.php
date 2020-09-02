<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Laravue\Models\Order;
use Faker\Generator as Faker;

$factory->define(Order::class, function (Faker $faker) {
    return [
        'order_no' => 'DEMO'.$faker->randomNumber(7),
        'price' => $faker->randomFloat(2,3,1000),
        'status' =>$faker->randomElement(['success', 'pending']),
        'updated_at' => $faker->dateTimeBetween('-5 years'),
        'created_at' => $faker->dateTimeBetween('-5 years'),
    ];
});
