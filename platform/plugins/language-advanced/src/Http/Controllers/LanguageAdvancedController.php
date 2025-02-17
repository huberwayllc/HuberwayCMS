<?php

namespace HuberwayCMS\LanguageAdvanced\Http\Controllers;

use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\LanguageAdvanced\Http\Requests\LanguageAdvancedRequest;
use HuberwayCMS\LanguageAdvanced\Supports\LanguageAdvancedManager;
use HuberwayCMS\Slug\Events\UpdatedSlugEvent;
use HuberwayCMS\Slug\Facades\SlugHelper;
use Illuminate\Support\Facades\DB;

class LanguageAdvancedController extends BaseController
{
    public function save(int|string $id, LanguageAdvancedRequest $request)
    {
        $model = $request->input('model');

        if (! class_exists($model)) {
            abort(404);
        }

        $data = (new $model())->findOrFail($id);

        LanguageAdvancedManager::save($data, $request);

        $request->merge([
            'is_slug_editable' => 0,
        ]);

        do_action(LANGUAGE_ADVANCED_ACTION_SAVED, $data, $request);

        event(new UpdatedContentEvent('', $request, $data));

        $slugId = $request->input('slug_id');

        $language = $request->input('language');

        if ($slugId && $language) {
            $table = 'slugs_translations';

            $condition = [
                'lang_code' => $language,
                'slugs_id' => $slugId,
            ];

            $slugData = array_merge($condition, [
                'key' => $request->input('slug'),
                'prefix' => SlugHelper::getPrefix($model),
            ]);

            $translate = DB::table($table)->where($condition)->first();

            if ($translate) {
                DB::table($table)->where($condition)->update($slugData);
            } else {
                DB::table($table)->insert($slugData);
            }

            UpdatedSlugEvent::dispatch($data, $data->slugable);
        }

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }
}
