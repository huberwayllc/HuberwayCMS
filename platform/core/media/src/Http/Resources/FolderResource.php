<?php

namespace HuberwayCMS\Media\Http\Resources;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Media\Models\MediaFolder;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin MediaFolder
 */
class FolderResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'color' => $this->color,
            'created_at' => BaseHelper::formatDate($this->created_at, 'Y-m-d H:i:s'),
            'updated_at' => BaseHelper::formatDate($this->updated_at, 'Y-m-d H:i:s'),
        ];
    }
}
