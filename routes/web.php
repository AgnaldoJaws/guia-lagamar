<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CityController;
use App\Http\Controllers\Api\PostController;

Route::get('/', function () {
    return redirect()->route('filament.admin.pages.dashboard');
});


Route::get('cities/{city}', [CityController::class, 'index']);
Route::get('subCategories/{category}/{city}', [PostController::class, 'index']);
Route::get('contenties/{category}/{city}', [PostController::class, 'goToAtrativos']);
Route::get('contenties/{category}/{city}/{user_id}', [PostController::class, 'getAtractives']);
Route::get('content/{content}', [PostController::class, 'show']);
