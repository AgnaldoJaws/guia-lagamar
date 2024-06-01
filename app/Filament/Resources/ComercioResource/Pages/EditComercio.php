<?php

namespace App\Filament\Resources\ComercioResource\Pages;

use App\Filament\Resources\ComercioResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditComercio extends EditRecord
{
    protected static string $resource = ComercioResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
