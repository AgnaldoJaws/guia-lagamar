<?php

namespace App\Http\Controllers\Api;


use App\Http\Controllers\Controller;
use App\Models\City;

class CityController extends Controller
{

    public function index($id){

         $city = City::find($id);

        return ['id' =>$city->id, 'cityName' => $city->cityName];


    }

}
