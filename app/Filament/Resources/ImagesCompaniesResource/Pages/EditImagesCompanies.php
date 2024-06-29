<?php

namespace App\Filament\Resources\ImagesCompaniesResource\Pages;

use App\Filament\Resources\ImagesCompaniesResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditImagesCompanies extends EditRecord
{
    protected static string $resource = ImagesCompaniesResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
