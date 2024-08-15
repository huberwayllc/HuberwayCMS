<?php

namespace HuberwayCMS\Blog\Services;

use HuberwayCMS\Blog\Models\Post;
use HuberwayCMS\Blog\Services\Abstracts\StoreCategoryServiceAbstract;
use Illuminate\Http\Request;

class StoreCategoryService extends StoreCategoryServiceAbstract
{
    public function execute(Request $request, Post $post): void
    {
        $post->categories()->sync($request->input('categories', []));
    }
}
