<?php

namespace HuberwayCMS\Ecommerce\Imports;

use HuberwayCMS\Base\Facades\BaseHelper;
use Carbon\Carbon;
use DateTime;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;
use PhpOffice\PhpSpreadsheet\Shared\Date;

trait ImportTrait
{
    protected int $totalImported = 0;

    protected array $successes = [];

    public function getTotalImported(): int
    {
        return $this->totalImported;
    }

    public function setTotalImported(): self
    {
        ++$this->totalImported;

        return $this;
    }

    public function onSuccess(array|Collection|Model $item): void
    {
        $this->successes[] = $item;
    }

    public function successes(): Collection
    {
        return collect($this->successes);
    }

    public function transformDate($value, $format = ''): string
    {
        $format = $format ?: BaseHelper::getDateTimeFormat();

        try {
            return Carbon::instance(Date::excelToDateTimeObject($value))->format($format);
        } catch (Exception) {
            return Carbon::createFromFormat($format, $value);
        }
    }

    public function getDate($value, $format = 'Y-m-d H:i:s', $default = null): string|null
    {
        try {
            $date = DateTime::createFromFormat('!' . $format, $value);

            return $date ? $date->format(BaseHelper::getDateTimeFormat()) : $value;
        } catch (Exception) {
            return $default;
        }
    }
}
