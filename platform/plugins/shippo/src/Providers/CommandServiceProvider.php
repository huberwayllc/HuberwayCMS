<?php

namespace HuberwayCMS\Shippo\Providers;

use HuberwayCMS\Shippo\Commands\InitShippoCommand;
use Illuminate\Support\ServiceProvider;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        $this->commands([
            InitShippoCommand::class,
        ]);
    }
}
