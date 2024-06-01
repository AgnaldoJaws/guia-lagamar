<?php

namespace App\Filament\Resources\ImagePostResource\Actions;

use Filament\Tables\Actions\Action;

class RedirectToImagePostsAction extends Action
{


    public function handle($record)
    {
        // Obtém o ID do registro
        $id = $record->getKey();

        // Redireciona para a URL desejada passando o ID como parâmetro
        return redirect()->to("http://localhost:8083/admin/image-posts?id=$id");
    }
}
