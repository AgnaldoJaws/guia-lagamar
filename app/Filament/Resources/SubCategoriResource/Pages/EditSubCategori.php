<?php

namespace App\Filament\Resources\SubCategoriResource\Pages;

use App\Filament\Resources\SubCategoriResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSubCategori extends EditRecord
{
    protected static string $resource = SubCategoriResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
