<?php

namespace HuberwayCMS\Location\Rules;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Location\Models\State;
use Illuminate\Contracts\Validation\DataAwareRule;
use Illuminate\Contracts\Validation\Rule;
use Illuminate\Support\Arr;

class StateRule implements DataAwareRule, Rule
{
    protected array $data = [];

    public function __construct(protected string|null $countryKey = '')
    {
    }

    public function setData($data): self
    {
        $this->data = $data;

        return $this;
    }

    public function passes($attribute, $value): bool
    {
        $condition = [
            'id' => $value,
            'status' => BaseStatusEnum::PUBLISHED,
        ];

        if ($this->countryKey && ($countryId = Arr::get($this->data, $this->countryKey))) {
            $condition['country_id'] = $countryId;
        }

        return State::query()->where($condition)->exists();
    }

    public function message(): string
    {
        return trans('validation.exists');
    }
}
