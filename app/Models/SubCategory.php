<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class SubCategory extends Model
{
    use HasFactory;

    protected $table = 'sub_categories';

    protected $fillable = [
        'nome_subcategory',
    ];

    public function getFullUrlAttribute()
    {
        return url('http://guialagamar.com.br/storage/lagamar/images/subcategory').'/'.$this->imagem;

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
