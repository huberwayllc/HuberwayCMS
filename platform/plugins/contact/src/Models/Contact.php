<?php

namespace HuberwayCMS\Contact\Models;

use HuberwayCMS\Base\Casts\SafeContent;
use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Base\Supports\Avatar;
use HuberwayCMS\Contact\Enums\ContactStatusEnum;
use HuberwayCMS\Media\Facades\RvMedia;
use Exception;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Contact extends BaseModel
{
    protected $table = 'contacts';

    protected $fillable = [
        'name',
        'email',
        'phone',
        'address',
        'subject',
        'content',
        'status',
    ];

    protected $casts = [
        'status' => ContactStatusEnum::class,
        'name' => SafeContent::class,
        'address' => SafeContent::class,
        'subject' => SafeContent::class,
        'content' => SafeContent::class,
    ];

    public function replies(): HasMany
    {
        return $this->hasMany(ContactReply::class);
    }

    protected function avatarUrl(): Attribute
    {
        return Attribute::get(function () {
            try {
                return (new Avatar())->create($this->name)->toBase64();
            } catch (Exception) {
                return RvMedia::getDefaultImage();
            }
        });
    }
}
