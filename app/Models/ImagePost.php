<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImagePost extends Model
{
    use HasFactory;
    protected $table = 'imagescontents';

    protected $appends = ['full_url','full_url_img'];

    protected $fillable = [
        'id','file','caption','description','informacaos_id'
    ];

    public function getFullUrlAttribute()
    {
        return url('storage/lagamar/post/logo').'/'.$this->file;

    }

    public function getFullUrlImgAttribute()
    {
        return url('storage/lagamar/atrativos/imagens').'/'.$this->file;
    }

    public function post() {
        return $this->hasOne(Information::class, 'id', 'informacoes_id' );
    }
}
