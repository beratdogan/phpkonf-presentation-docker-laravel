<?php

Route::get('/', function () {
    return view('welcome');
});

Route::get('/berat', function() {
    return 'aww';
});

Route::resource('blog', 'BlogController', ['only' => ['index', 'create']]);