<?php

namespace HuberwayCMS\Location\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Location\Models\City;
use Illuminate\Queue\SerializesModels;

class ImportedCityEvent extends Event
{
    use SerializesModels;

    public function __construct(public array $row, public City $city)
    {
    }
}
