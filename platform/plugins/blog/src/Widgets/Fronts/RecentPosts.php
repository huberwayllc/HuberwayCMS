<?php

namespace HuberwayCMS\Blog\Widgets\Fronts;

use HuberwayCMS\Base\Forms\FieldOptions\NameFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\NumberFieldOption;
use HuberwayCMS\Base\Forms\Fields\NumberField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Blog\Models\Post;
use HuberwayCMS\Widget\AbstractWidget;
use HuberwayCMS\Widget\Forms\WidgetForm;
use Illuminate\Support\Collection;

class RecentPosts extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Recent posts'),
            'description' => __('Recent posts widget.'),
            'number_display' => 5,
        ]);
    }

    protected function data(): array|Collection
    {
        if (! is_plugin_active('blog')) {
            return ['posts' => []];
        }

        $posts = Post::query()
            ->wherePublished()
            ->limit((int)$this->getConfig('number_display'))
            ->with('slugable')
            ->select('*')
            ->orderByDesc('created_at')
            ->get();

        return compact('posts');
    }

    protected function settingForm(): WidgetForm|string|null
    {
        if (! is_plugin_active('blog')) {
            return null;
        }

        return WidgetForm::createFromArray($this->getConfig())
            ->add('name', TextField::class, NameFieldOption::make()->toArray())
            ->add(
                'number_display',
                NumberField::class,
                NumberFieldOption::make()
                    ->label(__('Number posts to display'))
                    ->toArray()
            );
    }
}
