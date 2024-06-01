<?php

namespace App\Filament\Resources\PostResource\Pages;

use App\Filament\Resources\PostResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListPosts extends ListRecords
{
    protected static string $resource = PostResource::class;

    protected static ?string $title = 'Atrativos';

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Cadastrar'),
        ];
    }

}
