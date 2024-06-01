<?php

namespace App\Filament\Resources\ImagePostResource\Pages;

use App\Filament\Resources\ImagePostResource;
use Filament\Resources\Pages\Page;

class Galery extends Page
{
    protected static string $resource = ImagePostResource::class;

    protected static string $view = 'filament.resources.image-post-resource.pages.galery';
}
