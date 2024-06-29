<?php

namespace App\Filament\Resources\ImagesCompaniesResource\Pages;

use App\Filament\Resources\ImagesCompaniesResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListImagesCompanies extends ListRecords
{
    protected static string $resource = ImagesCompaniesResource::class;

    protected static ?string $title = 'Comercio';

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Nova Imagem'),
        ];
    }
}
