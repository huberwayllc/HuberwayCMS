<?php

namespace HuberwayCMS\Shortcode\Http\Controllers;

use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Shortcode\Events\ShortcodeAdminConfigRendering;
use HuberwayCMS\Shortcode\Facades\Shortcode;
use HuberwayCMS\Shortcode\Http\Requests\GetShortcodeDataRequest;
use Closure;
use Illuminate\Support\Arr;

class ShortcodeController extends BaseController
{
    public function ajaxGetAdminConfig(string|null $key, GetShortcodeDataRequest $request)
    {
        ShortcodeAdminConfigRendering::dispatch();

        $registered = shortcode()->getAll();

        $key = $key ?: $request->input('key');

        $data = Arr::get($registered, $key . '.admin_config');

        $attributes = [];
        $content = null;

        if ($code = $request->input('code')) {
            $compiler = shortcode()->getCompiler();
            $attributes = $compiler->getAttributes(html_entity_decode($code));
            $content = $compiler->getContent();
        }

        if ($data instanceof Closure || is_callable($data)) {
            $data = call_user_func($data, $attributes, $content);

            if ($modifier = Arr::get($registered, $key . '.admin_config_modifier')) {
                $data = call_user_func($modifier, $data, $attributes, $content);
            }

            $data = $data instanceof FormAbstract ? $data->renderForm() : $data;
        }

        $data = apply_filters(SHORTCODE_REGISTER_CONTENT_IN_ADMIN, $data, $key, $attributes);

        if (! $data) {
            $data = Html::tag('code', Shortcode::generateShortcode($key, $attributes))->toHtml();
        }

        return $this
            ->httpResponse()
            ->setData($data);
    }
}
