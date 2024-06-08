<?php

namespace App\Filament\Resources\PostResource\Pages;

use App\Filament\Resources\PostResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use SON\Models\AtrativosSubs;

class CreatePost extends CreateRecord
{
    protected static string $resource = PostResource::class;

    protected static ?string $title = 'Novo Atrativo';

    protected static ?string $navigationLabel = 'Custom Navigation Label';

    protected static ?string $slug = 'custom-url-slug';

    public function afterCreate()
    {
        $formData = $this->form->getState();
        $subCategories = $formData['subcategory'];

        foreach ($subCategories as $item)
        {
            $atrativoSub = new \App\Models\AtrativosSubs();
            $atrativoSub->atrativo_id = $this->record->getKey();
            $atrativoSub->subcat_id = $item;
            $atrativoSub->cities_id = $formData['cities_id'];
            $atrativoSub->save();
        }

    }


}
