<?php

namespace HuberwayCMS\SeoHelper\Entities\OpenGraph;

use HuberwayCMS\SeoHelper\Bases\MetaCollection as BaseMetaCollection;

class MetaCollection extends BaseMetaCollection
{
    protected $prefix = 'og:';

    protected $nameProperty = 'property';
}
