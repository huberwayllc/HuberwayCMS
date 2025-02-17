<?php

namespace HuberwayCMS\Marketplace\Exports;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Table\Supports\TableExportHandler;
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;

class ProductExport extends TableExportHandler
{
    protected function afterSheet(AfterSheet $event): void
    {
        parent::afterSheet($event);

        $totalRows = $this->collection->count() + 1;

        $event->sheet->getDelegate()
            ->getStyle('F1:F' . $totalRows)
            ->getAlignment()
            ->setHorizontal(Alignment::HORIZONTAL_CENTER);

        $event->sheet
            ->getDelegate()
            ->getStyle('C1:C' . $totalRows)
            ->getAlignment()
            ->setHorizontal(Alignment::HORIZONTAL_LEFT);

        $event->sheet->getDelegate()
            ->getColumnDimension('C')
            ->setWidth(40);

        for ($index = 2; $index <= $totalRows; $index++) {
            $this->drawingImage($event, 'B', $index);

            $status = $event->sheet->getDelegate()
                ->getStyle('I' . $index)
                ->getFont()
                ->getColor();

            $value = $event->sheet->getDelegate()
                ->getCell('I' . $index)
                ->getValue();

            if ($value == BaseStatusEnum::PUBLISHED) {
                $status->setARGB('1d9977');
            } else {
                $status->setARGB('dc3545');
            }

            $event->sheet
                ->getDelegate()
                ->getCell('I' . $index)
                ->setValue(BaseStatusEnum::getLabel($value));
        }
    }
}
