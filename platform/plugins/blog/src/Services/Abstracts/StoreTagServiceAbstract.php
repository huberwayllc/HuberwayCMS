<?php

namespace HuberwayCMS\Blog\Services\Abstracts;

use HuberwayCMS\Blog\Models\Post;
use Illuminate\Http\Request;

abstract class StoreTagServiceAbstract
{
    abstract public function execute(Request $request, Post $post): void;
}
