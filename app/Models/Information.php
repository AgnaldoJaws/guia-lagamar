<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
        'subCategory_id'
    ];

    use HasFactory;

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            $model->logoPath = basename($model->logoPath);
        });
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


}
