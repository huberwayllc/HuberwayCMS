<?php

namespace HuberwayCMS\Blog\Services\Abstracts;

use HuberwayCMS\Blog\Models\Post;
use Illuminate\Http\Request;

abstract class StoreCategoryServiceAbstract
{
    public function __construct()
    {
    }

    abstract public function execute(Request $request, Post $post): void;
}
