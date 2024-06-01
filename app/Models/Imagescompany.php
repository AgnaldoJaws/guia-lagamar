<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Imagescompany extends Model
{

    protected $appends = ['full_url'];

    protected  $fillable = ['id','file','companies_id'];

    public function getFullUrlAttribute()
    {
        return url('lagamar/comercio/imagens').'/'.$this->file;

    }


}
