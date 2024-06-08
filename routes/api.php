<?php


Route::group(['middleware' => 'cors'], function(){

    Route::get('subCategories/{category}/{city}', 'Api\PostController@index');
    Route::get('contenties/{category}/{city}', 'Api\PostController@goToAtrativos');
    Route::get('contenties/{category}/{city}/{user_id}', 'Api\PostController@getAtractives');
    Route::get('content/{content}', 'Api\PostController@show');
    Route::get('slider/{are}/{type}/{city}', 'Api\SliderAppController@getSlider');
    Route::get('cities/{city}', 'Api\CityController@index');
    Route::get('subByCity/{id}', 'Api\PostController@getSubCategories');
    Route::get('getSubcategories', 'Api\PostController@getAllSubcategories');
    Route::get('getSubcategories/{cities_id}/{cat_id}', 'Api\PostController@getAllSubcategories');

});
