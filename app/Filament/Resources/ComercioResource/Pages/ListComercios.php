<?php

namespace App\Filament\Resources\ComercioResource\Pages;

use App\Filament\Resources\ComercioResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListComercios extends ListRecords
{
    protected static string $resource = ComercioResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Cadastrar'),
        ];
    }
}
