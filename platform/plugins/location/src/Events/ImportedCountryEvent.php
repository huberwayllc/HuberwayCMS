<?php

namespace HuberwayCMS\Location\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Location\Models\Country;
use Illuminate\Queue\SerializesModels;

class ImportedCountryEvent extends Event
{
    use SerializesModels;

    public function __construct(public array $row, public Country $country)
    {
    }
}
