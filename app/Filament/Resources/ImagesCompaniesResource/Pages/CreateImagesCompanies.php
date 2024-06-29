<?php

namespace App\Filament\Resources\ImagesCompaniesResource\Pages;

use App\Filament\Resources\ImagesCompaniesResource;
use App\Helpers\ImageHelper;
use App\Models\ImagePost;
use App\Models\Imagescompany;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateImagesCompanies extends CreateRecord
{
    protected static string $resource = ImagesCompaniesResource::class;

    protected static ?string $title = 'Comercio';

    public function beforeCreate()
    {

        $formData = $this->form->getState();

        foreach ($formData['imagem'] as $path => $filename)
        {
            $source = storage_path('app/public/' . $path);

            $destination = storage_path('app/public/' . $path);

            ImageHelper::compressImage($source, $destination, 40);
        }
    }

    public function afterCreate() {
        $formData = $this->form->getState();

        foreach ($formData['imagem'] as $path => $filename){

            $imageObj = new Imagescompany();
            $imageObj->file = basename($path);
            $imageObj->caption = '';
            $imageObj->description = '';
            $imageObj->companies_id = $formData['companie'];
            $imageObj->save();
        }

    }
}
