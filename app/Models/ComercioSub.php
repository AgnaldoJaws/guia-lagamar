<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ComercioSub extends Model
{

    protected $table = 'comercio_subs';

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
    }

    protected $fillable = [
        'comercio_id',
        'subcat_id',
    ];


    public function subCategory()
    {
        return $this->belongsTo(SubCategory::class, 'subcat_id', 'id');
    }

}
