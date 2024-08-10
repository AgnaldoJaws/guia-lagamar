<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

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

        static::created(function ($model) {
            DB::table('cache')->where('key', 'like', '%laravel_cache%')->delete();
        });

        static::updated(function ($model) {
            DB::table('cache')->where('key', 'like', '%laravel_cache%')->delete();
        });

        static::deleted(function ($model) {
            DB::table('cache')->where('key', 'like', '%laravel_cache%')->delete();
        });

        if(Auth::check() && !Str::startsWith(request()->path(), 'api')){
            if (!Auth::user()->isAdmin()) {
                static::addGlobalScope('user_posts', function (\Illuminate\Database\Eloquent\Builder $builder) {
                    $builder->where('user_id', Auth::id());
                });
            }
        }

//        static::creating(function ($model) {
//
//        });
    }

}
