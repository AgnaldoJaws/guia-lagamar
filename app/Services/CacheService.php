<?php

namespace App\Services;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Artisan;

class CacheService
{
    public static function clearCacheByPattern($pattern)
    {
        Artisan::call('cache:clear');
        Artisan::call('config:cache');
    }

}
