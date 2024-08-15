<?php

use HuberwayCMS\LanguageAdvanced\Plugin;
use Illuminate\Database\Migrations\Migration;

return new class () extends Migration {
    public function up(): void
    {
        Plugin::activated();
    }
};
