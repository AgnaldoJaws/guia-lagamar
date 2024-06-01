<?php

namespace App\Filament\Resources\ImagePostResource\Pages;

use App\Filament\Resources\ImagePostResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditImagePost extends EditRecord
{
    protected static string $resource = ImagePostResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
