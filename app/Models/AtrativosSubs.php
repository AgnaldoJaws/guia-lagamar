<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class AtrativosSubs extends Model
{
    use HasFactory;

    protected $table = 'atrativo_subs';

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

    public function subCategory()
    {
        return $this->belongsTo(SubCategory::class, 'subcat_id', 'id');
    }

    public function atrativos()
    {
        return $this->hasMany(Information::class, 'id', 'atrativo_id');
    }
}
