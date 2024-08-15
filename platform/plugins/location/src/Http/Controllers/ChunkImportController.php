<?php

namespace HuberwayCMS\Location\Http\Controllers;

use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Location\Concerns\ChunkFile;
use HuberwayCMS\Location\Http\Requests\ChunkFileRequest;
use HuberwayCMS\Location\Services\ImportLocationService;
use Exception;
use Illuminate\Support\Facades\File;

class ChunkImportController extends BaseController
{
    use ChunkFile;

    public function __invoke(
        ChunkFileRequest $request,
        ImportLocationService $importLocationService
    ): BaseHttpResponse {
        try {
            $filePath = $this->getFilePath($request->input('file'));
        } catch (Exception $exception) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($exception->getMessage());
        }

        $offset = $request->integer('offset');
        $limit = $request->integer('limit', 500);
        $rows = $this->getLocationRows($filePath, $offset, $limit);
        $rowsCount = count($rows);
        $total = $offset + $rowsCount;

        if ($rowsCount <= 0) {
            File::delete($filePath);

            return $this
                ->httpResponse()
                ->setMessage(trans('plugins/location::bulk-import.imported_successfully'))
                ->setData([
                    'total_message' => trans('plugins/location::bulk-import.total_rows', [
                        'total' => number_format($total),
                    ]),
                ]);
        }

        $importLocationService->handle($rows);

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/location::bulk-import.importing_message', [
                'from' => number_format($offset),
                'to' => number_format($total),
            ]))
            ->setData([
                'offset' => $total,
                'count' => $rowsCount,
            ]);
    }
}
