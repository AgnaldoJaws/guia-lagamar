<?php

namespace App\Models;

use App\Services\CacheService;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class Information extends Model
{
    protected $table = 'guialagamar.information';

    protected $appends = ['full_url'];

    protected $fillable = [
        'id',
        'title',
        'desc',
        'content',
        'logoPath',
        'references',
        'location',
        'lat',
        'long',
        'forma_acesso',
        'cities_id',
        'category_id',
        'file'
    ];

    use HasFactory;

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

        static::creating(function ($model) {
            $model->logoPath = basename($model->logoPath);
            $model->user_id = Auth::user()->id;
        });

        static::saving(function ($model){
            $formData = $model->getAttributes();

            if(!empty(basename($formData['file']))){
                $model->logoPath = basename($formData['file']);
                $model->file = 1;
            }

            $model->category_id = null;

            $subCategories = $formData['category_id'];

            if($subCategories && isset($formData['id'])){

                $model->atrativoSubs()->delete();

                foreach ($subCategories as $item)
                {
                    $atrativoSub = new AtrativosSubs();
                    $atrativoSub->atrativo_id = $formData['id'];
                    $atrativoSub->subcat_id = $item;
                    $atrativoSub->cities_id = $formData['cities_id'];
                    $atrativoSub->save();
                }
            }


        });

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
        return url('/storage/lagamar/atrativos/logo').'/'.$this->logoPath;
    }


    public function city() {

        return $this->hasOne(City::class, 'id', 'cities_id' );
    }

    public function atrativoSubs()
    {
        return $this->hasMany(AtrativosSubs::class, 'atrativo_id', 'id');
    }

    public function images()
    {
        return $this->hasMany(ImagePost::class, 'informacaos_id', 'id');
    }

    public function author(){
        return $this->hasOne(User::class,'id','user_id');
    }


}
