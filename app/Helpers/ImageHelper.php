<?php

// app/Helpers/ImageHelper.php

namespace App\Helpers;

class ImageHelper
{
    public static function compressImage($source, $destination, $quality = 75)
    {
        // Obter informações da imagem
        $info = getimagesize($source);
        $mime = $info['mime'];

        // Criar uma imagem a partir do arquivo de origem
        switch ($mime) {
            case 'image/jpeg':
                $image = imagecreatefromjpeg($source);
                break;
            case 'image/png':
                $image = imagecreatefrompng($source);
                break;
            case 'image/gif':
                $image = imagecreatefromgif($source);
                break;
            default:
                return false; // Formato de imagem não suportado
        }


        // Ajustar a qualidade da imagem JPEG
        if ($mime == 'image/jpeg') {
            imagejpeg($image, $destination, $quality);
        } elseif ($mime == 'image/png') {
            imagepng($image, $destination, $quality);
        } elseif ($mime == 'image/gif') {
            imagegif($image, $destination);
        }

        // Liberar a memória
        imagedestroy($image);

        return true; // Imagem comprimida com sucesso
    }
}
