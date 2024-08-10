<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class City extends Model
{
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
    }
    protected $fillable = [
        'cityName',
    ];

    public function subcategories()
    {
        return $this->hasMany(SubCategory::class,'cities_id','id');
    }
}
