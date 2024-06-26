<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class ComercioSub extends Model
{

    protected $table = 'comercio_subs';


    protected $fillable = [
        'comercio_id',
        'subcat_id',
    ];


    public function subCategory()
    {
        return $this->belongsTo(SubCategory::class, 'subcat_id', 'id');
    }

}
