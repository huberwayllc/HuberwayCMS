<?php

namespace HuberwayCMS\AuditLog\Models;

use HuberwayCMS\ACL\Models\User;
use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Base\Models\BaseQueryBuilder;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\MassPrunable;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Query\Builder;

class AuditHistory extends BaseModel
{
    use MassPrunable;

    protected $table = 'audit_histories';

    protected $fillable = [
        'user_agent',
        'ip_address',
        'module',
        'action',
        'user_id',
        'reference_user',
        'reference_id',
        'reference_name',
        'type',
        'request',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class)->withDefault();
    }

    public function prunable(): Builder|BaseQueryBuilder
    {
        return static::query()->where('created_at', '<=', Carbon::now()->subMonth());
    }
}
