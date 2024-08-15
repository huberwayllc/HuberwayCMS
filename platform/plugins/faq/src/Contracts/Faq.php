<?php

namespace HuberwayCMS\Faq\Contracts;

use HuberwayCMS\Faq\FaqCollection;

interface Faq
{
    public function registerSchema(FaqCollection $faqs): void;
}
