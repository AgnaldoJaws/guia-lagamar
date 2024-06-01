<?php

namespace App\Filament\Resources\SubCategoriResource\Pages;

use App\Filament\Resources\SubCategoriResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateSubCategori extends CreateRecord
{
    protected static ?string $title = 'Nova Subcategoria';

    protected static string $resource = SubCategoriResource::class;
}
