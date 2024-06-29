<?php

namespace App\Models\Traits;

use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\ImageManager;
use Illuminate\Support\Facades\Storage;

trait ImageProcessing
{
    /**
     * Compress and convert an uploaded image to WebP format.
     *
     * @param \Illuminate\Http\UploadedFile $image
     * @param string $path
     * @param int $quality
     * @return string
     */
    public function processAndUploadImage($image, $path, $quality = 70)
    {


//        $manager = new ImageManager(
//            new Driver()
//        );
//
//        $imageM = $manager->read($image->getRealPath());
//
//        $imageM->resize(height: 300);
//
//        $imageM->toJpg();
//
//        $imageM->save('teste');
    }
}
