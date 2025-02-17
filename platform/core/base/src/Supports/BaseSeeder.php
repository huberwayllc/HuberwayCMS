<?php

namespace HuberwayCMS\Base\Supports;

use HuberwayCMS\Base\Events\FinishedSeederEvent;
use HuberwayCMS\Base\Events\SeederPrepared;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Models\MetaBox as MetaBoxModel;
use HuberwayCMS\Media\Facades\RvMedia;
use HuberwayCMS\Media\Models\MediaFile;
use HuberwayCMS\Media\Models\MediaFolder;
use HuberwayCMS\Setting\Facades\Setting;
use Carbon\Carbon;
use Faker\Generator;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Database\Seeder;
use Illuminate\Support\Collection;
use Illuminate\Support\Composer;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Traits\Conditionable;
use Symfony\Component\Process\Process;
use Throwable;

class BaseSeeder extends Seeder
{
    use Conditionable;

    protected Generator $faker;

    protected Carbon $now;

    public function uploadFiles(string $folder, string|null $basePath = null): array
    {
        $folderPath = $basePath ?: database_path('seeders/files/' . $folder);

        if (! File::isDirectory($folderPath)) {
            throw new FileNotFoundException('Folder not found: ' . $folderPath);
        }

        $storage = Storage::disk('public');

        if ($storage->exists($folder)) {
            $storage->deleteDirectory($folder);
        }

        MediaFile::query()->where('url', 'LIKE', $folder . '/%')->forceDelete();
        MediaFolder::query()->where('name', $folder)->forceDelete();

        $files = [];

        foreach (File::allFiles($folderPath) as $file) {
            $files[] = RvMedia::uploadFromPath($file, 0, $folder);
        }

        return $files;
    }

    protected function filePath(string $path, string|null $basePath = null): string
    {
        $storage = Storage::disk('public');

        if ($storage->exists($path)) {
            return $path;
        }

        $filePath = ($basePath ?: database_path('seeders/files/' . $path));

        if (! File::exists($filePath)) {
            throw new FileNotFoundException('File not found: ' . $filePath);
        }

        RvMedia::uploadFromPath($filePath, 0, File::dirname($path));

        return $path;
    }

    public function prepareRun(): void
    {
        $this->faker = $this->fake();

        Setting::newQuery()->truncate();

        Setting::forgetAll();

        Setting::forceSet('media_random_hash', md5((string)time()));

        Setting::set('api_enabled', 0);

        Setting::save();

        MetaBoxModel::query()->truncate();

        SeederPrepared::dispatch();
    }

    protected function random(int $from, int $to, array $exceptions = []): int
    {
        sort($exceptions); // lets us use break; in the foreach reliably
        $number = rand($from, $to - count($exceptions)); // or mt_rand()

        foreach ($exceptions as $exception) {
            if ($number >= $exception) {
                $number++; // make up for the gap
            } else { /*if ($number < $exception)*/
                break;
            }
        }

        return $number;
    }

    protected function finished(): void
    {
        FinishedSeederEvent::dispatch();
    }

    protected function fake(): Generator
    {
        if (isset($this->faker)) {
            return $this->faker;
        }

        if (! class_exists(\Faker\Factory::class)) {
            $this->command->warn('It requires <info>fakerphp/faker</info> to run seeder. Need to run <info>composer install</info> to install it first.');

            try {
                $composer = new Composer($this->command->getLaravel()['files']);

                $process = new Process(array_merge($composer->findComposer(), ['install']));

                $process->start();

                $process->wait(function ($type, $buffer) {
                    $this->command->line($buffer);
                });

                $this->command->warn('Please re-run <info>php artisan db:seed</info> command.');
            } catch (Throwable) {
            }

            exit(1);
        }

        $this->faker = fake();

        return $this->faker;
    }

    protected function now(): Carbon
    {
        if (isset($this->now)) {
            return $this->now;
        }

        $this->now = Carbon::now();

        return $this->now;
    }

    protected function removeBaseUrlFromString(string $value): string|null
    {
        return str_replace(url(''), '', $value);
    }

    protected function getFilesFromPath(string $path): Collection
    {
        $directoryPath = database_path('seeders/files/' . $path);

        $files = [];

        if (File::isDirectory($directoryPath)) {
            $files = array_map(fn ($item) => $path . '/' . $item, BaseHelper::scanFolder($directoryPath));
        }

        return collect($files);
    }

    protected function saveSettings(array $settings): void
    {
        Setting::delete(array_keys($settings));

        Setting::forceSet($settings)->save();
    }
}
