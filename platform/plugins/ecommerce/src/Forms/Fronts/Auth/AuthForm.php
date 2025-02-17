<?php

namespace HuberwayCMS\Ecommerce\Forms\Fronts\Auth;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Forms\Fields\HtmlField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Theme\Facades\Theme;

abstract class AuthForm extends FormAbstract
{
    public function setup(): void
    {
        Theme::asset()->add('auth-css', 'vendor/core/plugins/ecommerce/css/front-auth.css');

        $this
            ->contentOnly()
            ->template('plugins/ecommerce::customers.forms.auth');
    }

    public function submitButton(string $label, string $icon = null, string $iconPosition = 'append'): static
    {
        $iconHtml = $icon ? BaseHelper::renderIcon($icon) : '';

        return $this
            ->add('openButtonWrap', HtmlField::class, [
                'html' => '<div class="d-grid">',
            ])
            ->add('submit', 'submit', [
                'label' =>
                    ($icon && $iconPosition === 'prepend' ? $iconHtml : '')
                    . $label
                    . ($icon && $iconPosition === 'append' ? $iconHtml : ''),
                'attr' => [
                    'class' => 'btn btn-primary btn-auth-submit',
                ],
            ])
            ->add('closeButtonWrap', HtmlField::class, [
                'html' => '</div>',
            ]);
    }

    public function banner(string $banner): static
    {
        return $this->setFormOption('banner', $banner);
    }

    public function icon(string $icon): static
    {
        return $this->setFormOption('icon', $icon);
    }

    public function heading(string $heading): static
    {
        return $this->setFormOption('heading', $heading);
    }

    public function description(string $description): static
    {
        return $this->setFormOption('description', $description);
    }
}
