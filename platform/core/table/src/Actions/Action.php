<?php

namespace HuberwayCMS\Table\Actions;

use HuberwayCMS\Base\Supports\Builders\HasAttributes;
use HuberwayCMS\Base\Supports\Builders\HasColor;
use HuberwayCMS\Base\Supports\Builders\HasIcon;
use HuberwayCMS\Base\Supports\Builders\HasUrl;
use HuberwayCMS\Table\Abstracts\TableActionAbstract;
use HuberwayCMS\Table\Actions\Concerns\HasAction;

class Action extends TableActionAbstract
{
    use HasAction;
    use HasAttributes;
    use HasColor;
    use HasIcon;
    use HasUrl;
}
