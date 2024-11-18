<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;


class SubCategory extends Model
{
    use HasFactory;

    protected $table = 'sub_categories';

    protected $fillable = [
        'nome_subcategory',
        'imagem',
        'category_id',
        'cities_id'
    ];

    protected static function boot()
    {
        parent::boot();

        static::saving(function ($model) {

            foreach ($model->imagem as $filename){

                $imgName = (pathinfo($filename, PATHINFO_BASENAME));
            }
            if(!empty($imgName)){
                $model->imagem = $imgName;
            }

        });
        static::created(function ($model) {

            DB::table('cache')->where('key', 'like', '%laravel_cache%')->delete();
        });

        static::updated(function ($model) {
            DB::table('cache')->where('key', 'like', '%laravel_cache%')->delete();
        });

        static::deleted(function ($model) {
            DB::table('cache')->where('key', 'like', '%laravel_cache%')->delete();
        });
    }

    public function getFullUrlAttribute()
    {
        return url(config('app.url').'/storage/lagamar/images/subcategory').'/'.$this->imagem;

    }

    public function city()
    {
        return $this->hasOne(City::class,'id','cities_id');
    }

    public function category()
    {
        return $this->hasOne(\App\Models\Category::class,'id','category_id');
    }

    public function atrativoSubs()
    {
        return $this->hasMany(AtrativosSubs::class, 'subcat_id', 'id');
    }


}
