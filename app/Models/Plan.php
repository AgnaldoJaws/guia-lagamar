<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;


class Plan extends Model
{
    protected $table = 'plano_assinaturas';

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
        'nome_plano',
        'valor_anual',
        'valor_mensal',
        'descricao',

    ];
}
