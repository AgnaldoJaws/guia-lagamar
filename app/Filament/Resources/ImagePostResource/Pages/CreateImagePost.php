<?php

namespace App\Filament\Resources\ImagePostResource\Pages;

use App\Filament\Resources\ImagePostResource;
use App\Helpers\ImageHelper;
use App\Models\ImagePost;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Http\Request;

class CreateImagePost extends CreateRecord
{
    protected static string $resource = ImagePostResource::class;

    protected static ?string $title = 'Cadastrar Imagens';

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

            $imageObj = new ImagePost();
            $imageObj->file = basename($path);
            $imageObj->informacaos_id = $formData['post'];
            $imageObj->save();
        }

    }

}
