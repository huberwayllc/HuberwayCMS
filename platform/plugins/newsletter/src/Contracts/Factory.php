<?php

namespace HuberwayCMS\Newsletter\Contracts;

interface Factory
{
    public function driver(string $driver);
}
