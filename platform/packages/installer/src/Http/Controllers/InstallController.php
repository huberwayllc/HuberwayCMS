<?php

namespace HuberwayCMS\Installer\Http\Controllers;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Base\Services\DownloadLocaleService;
use HuberwayCMS\Base\Supports\Language;
use Carbon\Carbon;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\URL;
use Throwable;

class InstallController extends BaseController
{
    public function index(): View|RedirectResponse
    {
        $languages = collect(Language::getLocales())->mapWithKeys(fn ($item, $key) => [$key => "{$item} - {$key}"]);

        return view('packages/installer::welcome', compact('languages'));
    }

    public function next(
        Request $request,
        DownloadLocaleService $downloadLocaleService
    ): RedirectResponse {
        $request->validate([
            'language' => ['required', 'string'],
        ]);

        $language = $request->input('language');

        try {
            $downloadLocaleService->handle($language);
        } catch (Throwable $e) {
            BaseHelper::logError($e);
        }

        Session::put('site-locale', $language);

        $url = URL::signedRoute(
            'installers.requirements.index',
            expiration: Carbon::now()->addMinutes(30)
        );

        return redirect()->to($url);
    }
}
