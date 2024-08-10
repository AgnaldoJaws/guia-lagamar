<?php

use App\Http\Middleware\Cors;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CityController;
use App\Http\Controllers\Api\PostController;

Route::get('/', function () {
    return redirect()->route('filament.admin.pages.dashboard');
});


Route::group(['middleware' => Cors::class, 'prefix' => 'api'], function(){

    Route::get('cities/{city}', [CityController::class, 'index']);

    Route::get('subCategories/{category}/{city}', [PostController::class, 'index']);

    Route::get('contenties/{category}/{city}', [PostController::class, 'goToAtrativos']);

    Route::get('contentiesCity/{city}', [PostController::class, 'goToAtrativosByCidade']);

    Route::get('content/{content}', [PostController::class, 'show']);

    Route::get('subByCity/{id}', [PostController::class, 'getSubCategories']);

});
