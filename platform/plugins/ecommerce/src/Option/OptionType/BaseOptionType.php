<?php

namespace HuberwayCMS\Ecommerce\Option\OptionType;

use HuberwayCMS\Ecommerce\Models\Option;
use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Theme\Facades\Theme;

abstract class BaseOptionType
{
    public Option|array|null $option = null;

    public ?Product $product = null;

    public function setOption($option): self
    {
        $this->option = $option;

        return $this;
    }

    public function setProduct(Product $product): self
    {
        $this->product = $product;

        return $this;
    }

    abstract public function view(): string;

    public function render(): string
    {
        $view = 'plugins/ecommerce::themes.options.' . $this->view();

        $themeView = Theme::getThemeNamespace() . '::views.ecommerce.options.' . $this->view();

        if (view()->exists($themeView)) {
            $view = $themeView;
        }

        return view($view, ['option' => $this->option, 'product' => $this->product])->render();
    }
}
