<?php

use HuberwayCMS\Marketplace\Models\Store;
use HuberwayCMS\Slug\Facades\SlugHelper;
use HuberwayCMS\Slug\Models\Slug;
use Illuminate\Database\Migrations\Migration;

return new class () extends Migration {
    public function up(): void
    {
        try {
            Slug::query()
                ->where('reference_type', Store::class)
                ->update(['prefix' => SlugHelper::getPrefix(Store::class)]);
        } catch (Throwable) {
        }
    }
};
