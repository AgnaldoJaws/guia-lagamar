<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Comercio extends Model
{
    use HasFactory;

    protected $table = 'companies';

    protected $appends = ['full_url'];

    public function getFullUrlAttribute()
    {
        return url('/storage/lagamar/comercio/logo').'/'.$this->logoPath;

    }

    public function city()
    {
        return $this->hasOne(City::class,'id','cities_id');
    }

    public function category()
    {
        return $this->hasOne(Category::class,'id','category_id');
    }

    public function subcategory()
    {
        return $this->hasOne(SubCategory::class,'id','subcat_id');
    }

    public function plan()
    {
        return $this->hasOne(Plan::class,'id','plano_id');
    }

    public function comercio_subs()
    {
        return $this->belongsToMany(ComercioSub::class,'comercio_subs','comercio_id');
    }

    public function images()
    {
        return $this->belongsToMany(Imagescompany::class,'comercio_subs','comercio_id');
    }
}
