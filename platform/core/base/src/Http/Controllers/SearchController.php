<?php

namespace HuberwayCMS\Base\Http\Controllers;

use HuberwayCMS\Base\Contracts\GlobalSearchableManager;
use Illuminate\Http\Request;

class SearchController extends BaseController
{
    public function __invoke(GlobalSearchableManager $manager, Request $request)
    {
        $request->validate(['keyword' => ['nullable', 'string', 'max:1024']]);

        $results = $manager->search((string) $request->input('keyword'));

        return $this->httpResponse()
            ->setData(view('core/base::global-search.index', compact('results'))->render());
    }
}
