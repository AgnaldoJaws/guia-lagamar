<?php

namespace App\Filament\Resources\ComercioResource\Pages;

use App\Filament\Resources\ComercioResource;
use App\Models\ComercioSub;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateComercio extends CreateRecord
{
    protected static string $resource = ComercioResource::class;

    public function afterCreate()
    {
        $formData = $this->form->getState();

        $subCategories = $formData['category_id'];

        foreach ($subCategories as $item)
        {
            $comercioSub = new ComercioSub();
            $comercioSub->comercio_id = $this->record->getKey();
            $comercioSub->subcat_id = $item;
            $comercioSub->cities_id = $formData['cities_id'];
            $comercioSub->save();
        }

    }
}
