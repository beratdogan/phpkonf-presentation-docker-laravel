<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Blog as BlogModel;

class BlogController extends Controller
{
    public function index()
    {
        return BlogModel::all();
    }

    public function create()
    {
        return factory(BlogModel::class)->create();
    }
}
