<?php

namespace HuberwayCMS\Setting\Http\Controllers;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Media\Facades\RvMedia;
use HuberwayCMS\Media\Models\MediaFile;
use HuberwayCMS\Setting\Forms\MediaSettingForm;
use HuberwayCMS\Setting\Http\Requests\MediaSettingRequest;
use Exception;

class MediaSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('core/setting::setting.media.title'));

        $form =  MediaSettingForm::create();

        return view('core/setting::media', compact('form'));
    }

    public function update(MediaSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate([
            ...$request->validated(),
            'media_folders_can_add_watermark' => $request->boolean('media_folders_can_add_watermark_all')
                ? []
                : $request->input('media_folders_can_add_watermark', []),
        ]);
    }

    public function generateThumbnails(): BaseHttpResponse
    {
        BaseHelper::maximumExecutionTimeAndMemoryLimit();

        $files = MediaFile::query()->select(['url', 'mime_type', 'folder_id'])->get();

        $errors = [];

        if ($files->isNotEmpty()) {
            foreach ($files as $file) {
                try {
                    /**
                     * @var MediaFile $file
                     */
                    RvMedia::generateThumbnails($file);
                } catch (Exception) {
                    $errors[] = $file->url;
                }
            }

            $errors = array_unique($errors);

            $errors = array_map(function ($item) {
                return [$item];
            }, $errors);
        }

        if ($errors) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage(trans('core/setting::setting.generate_thumbnails_error', ['count' => count($errors)]));
        }

        return $this
            ->httpResponse()
            ->setMessage(trans('core/setting::setting.generate_thumbnails_success', ['count' => count($files)]));
    }
}
