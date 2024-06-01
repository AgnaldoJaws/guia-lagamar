<?php

namespace App\Filament\Resources\ImagePostResource\Pages;

use App\Filament\Resources\ImagePostResource;
use App\Models\ImagePost;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Http\Request;

class CreateImagePost extends CreateRecord
{
    protected static string $resource = ImagePostResource::class;

    protected static ?string $title = 'Cadastrar Imagens';

    public function afterCreate() {
        $formData = $this->form->getState();


        foreach ($formData['imagem'] as $key => $image){
            $imageObj = new ImagePost();
            $imageObj->file = basename($key);
            $imageObj->informacaos_id = $formData['post'];
            $imageObj->save();
        }

    }

}
