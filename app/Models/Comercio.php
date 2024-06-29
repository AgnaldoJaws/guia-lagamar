<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;


class Comercio extends Model
{
    use HasFactory;

    protected $table = 'guialagamar.companies';

    protected $fillable = [
        'nome_empresa',
        'plano_id',
        'category_id',
        'cities_id',
        'tel',
        'cel',
        'email',
        'endereco',
        'latitude',
        'longitude',
        'desc',
        'linkSite',
        'linkFace',
        'linkinstagram',
        'cep',
        'plano_id',
        'logoPath',
        'status'

    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {

            $model->logoPath = basename($model->logoPath);
            $model->user_id = Auth::user()->id;
            $model->subcat_id = null;
            $model->category_id = null;
        });

        static::saving(function ($model) {

            $formData = $model->getAttributes();

            if (count($formData['logoPath']) > 0) {
                $model->logoPath = basename($formData['logoPath'][0]);
            }
            $model->category_id = null;

            $subCategories = $formData['category_id'];

            if($subCategories && isset($formData['id'])){

                $model->comercio_subs()->delete();

                foreach ($subCategories as $item)
                {
                    $comercioSub = new ComercioSub();
                    $comercioSub->comercio_id = $formData['id'];
                    $comercioSub->subcat_id = $item;
                    $comercioSub->cities_id = $formData['cities_id'];
                    $comercioSub->save();
                }
            }

        });

        if (!Auth::check() || !Auth::user()->isAdmin()) {
            static::addGlobalScope('user_posts', function (\Illuminate\Database\Eloquent\Builder $builder) {
                $builder->where('user_id', Auth::id());
            });
        }
    }

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
        return $this->hasMany(ComercioSub::class,'comercio_id','id');
    }

    public function images()
    {
        return $this->belongsToMany(Imagescompany::class,'comercio_subs','comercio_id');
    }
}
