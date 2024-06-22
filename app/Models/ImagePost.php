<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class ImagePost extends Model
{
    use HasFactory;
    protected $table = 'guialagamar.imagescontents';


    protected $appends = ['full_url','full_url_img'];

    protected $fillable = [
        'id','file','caption','description','informacaos_id'
    ];

    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('user_posts', function (\Illuminate\Database\Eloquent\Builder $builder) {
            if (Auth::check() && !Auth::user()->isAdmin()) {
                $builder->whereHas('post.author', function ($query) {
                    $query->where('id', Auth::id());
                });
            }
        });
    }
    public function getFullUrlAttribute()
    {
        return url('storage/lagamar/post/logo').'/'.$this->file;

    }

    public function getFullUrlImgAttribute()
    {
        return url('storage/lagamar/atrativos/imagens').'/'.$this->file;
    }

    public function post() {
        return $this->hasOne(Information::class, 'id', 'informacaos_id' );
    }

}
