<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

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
        static::created(function ($model) {
            DB::table('cache')->where('key', 'like', '%laravel_cache%')->delete();
        });

        static::updated(function ($model) {
            DB::table('cache')->where('key', 'like', '%laravel_cache%')->delete();
        });

        static::deleted(function ($model) {
            DB::table('cache')->where('key', 'like', '%laravel_cache%')->delete();
        });

        parent::boot();

        if(Auth::check() && !Str::startsWith(request()->path(), 'api')){
            if (!Auth::user()->isAdmin()) {
                static::addGlobalScope('user_posts', function (\Illuminate\Database\Eloquent\Builder $builder) {
                    $builder->where('user_id', Auth::id());
                });
            }
        }
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
