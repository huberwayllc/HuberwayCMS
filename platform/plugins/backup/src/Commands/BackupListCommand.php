<?php

namespace HuberwayCMS\Backup\Commands;

use HuberwayCMS\Backup\Supports\Backup;
use HuberwayCMS\Base\Facades\BaseHelper;
use Exception;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;

use function Laravel\Prompts\table;

use Symfony\Component\Console\Attribute\AsCommand;

#[AsCommand('cms:backup:list', 'List all backups')]
class BackupListCommand extends Command
{
    public function handle(Backup $backupService): int
    {
        if (! File::exists($backupService->getBackupPath('backup.json'))) {
            $this->components->info('No backup found.');

            return self::FAILURE;
        }

        try {
            $backups = BaseHelper::getFileData($backupService->getBackupPath('backup.json'));

            foreach ($backups as $key => &$item) {
                $item['key'] = $key;
            }

            table([
                'Name',
                'Description',
                'Date',
                'Folder',
            ], $backups);
        } catch (Exception $exception) {
            $this->components->error($exception->getMessage());
        }

        return self::SUCCESS;
    }
}
