<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

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
        'subCategory_id',
        'file'
    ];

    use HasFactory;

    protected static function boot()
    {
        parent::boot();

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

        });
        if (!Auth::check() || !Auth::user()->isAdmin()) {
            static::addGlobalScope('user_posts', function (\Illuminate\Database\Eloquent\Builder $builder) {
                $builder->where('user_id', Auth::id());
            });
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
