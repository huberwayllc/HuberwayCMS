<?php

namespace HuberwayCMS\Faq;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Facades\MetaBox;
use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Faq\Contracts\Faq as FaqContract;
use HuberwayCMS\Faq\Models\Faq;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Throwable;

class FaqSupport implements FaqContract
{
    public function registerSchema(FaqCollection $faqs): void
    {
        $schema = [
            '@context' => 'https://schema.org',
            '@type' => 'FAQPage',
            'mainEntity' => [],
        ];

        foreach ($faqs->toArray() as $faq) {
            $schema['mainEntity'][] = [
                '@type' => 'Question',
                'name' => $faq->getQuestion(),
                'acceptedAnswer' => [
                    '@type' => 'Answer',
                    'text' => $faq->getAnswer(),
                ],
            ];
        }

        $schema = json_encode($schema);

        Theme::asset()
            ->container('header')
            ->writeScript('faq-schema', $schema, attributes: ['type' => 'application/ld+json']);
    }

    public function saveConfigs(BaseModel|Model $model, string|array|null $data): void
    {
        try {
            $config = $data;

            if (Str::isJson($config)) {
                $config = json_decode($config, true);
            }

            if (! empty($config) && is_array($config)) {
                foreach ($config as $key => $item) {
                    if (! $item[0]['value'] && ! $item[1]['value']) {
                        Arr::forget($config, $key);
                    }
                }
            }

            if (empty($config)) {
                MetaBox::deleteMetaData($model, 'faq_schema_config');
            } else {
                MetaBox::saveMetaBoxData($model, 'faq_schema_config', $config);
            }
        } catch (Throwable $exception) {
            BaseHelper::logError($exception);
        }
    }

    public function renderMetaBox(Model|null $model = null): string
    {
        Assets::addStylesDirectly(['vendor/core/plugins/faq/css/faq.css'])
            ->addScriptsDirectly(['vendor/core/plugins/faq/js/faq.js']);
        $value = [];
        $selectedFaqs = [];

        if ($model && $model->getKey()) {
            $value = MetaBox::getMetaData($model, 'faq_schema_config', true);
            $selectedFaqs = MetaBox::getMetaData($model, 'faq_ids', true) ?: [];
        }

        $hasValue = ! empty($value);

        $value = (array)$value;

        foreach ($value as $key => $item) {
            if (! is_array($item)) {
                continue;
            }

            foreach ($item as $subItem) {
                if (is_array($subItem['value'])) {
                    Arr::forget($value, $key);
                }
            }
        }

        $value = json_encode($value);

        $faqs = Faq::query()->wherePublished()->pluck('question', 'id')->all();

        return view('plugins/faq::schema-config-box', compact('value', 'hasValue', 'faqs', 'selectedFaqs'))->render();
    }
}
