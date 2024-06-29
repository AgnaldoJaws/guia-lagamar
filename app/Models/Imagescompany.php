<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Imagescompany extends Model
{

    protected $appends = ['full_url','full_url_img'];

    protected  $fillable = ['id','file','companies_id'];

    public function getFullUrlAttribute()
    {
        return url('storage/lagamar/comercio/imagens').'/'.$this->file;
    }

    public function getFullUrlImgAttribute()
    {
        return url('storage/lagamar/comercio/logo').'/'.$this->file;
    }

    public function comercio() {
        return $this->hasOne(Comercio::class, 'id', 'companies_id' );
    }

    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('user_posts', function (\Illuminate\Database\Eloquent\Builder $builder) {
            if (Auth::check() && !Auth::user()->isAdmin()) {
                $builder->whereHas('comercio.author', function ($query) {
                    $query->where('id', Auth::id());
                });
            }
        });

//        static::creating(function ($model) {
//
//        });
    }

}
