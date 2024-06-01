<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Plan extends Model
{
    protected $table = 'plano_assinaturas';

    protected $fillable = [
        'nome_plano',
        'valor_anual',
        'valor_mensal',
        'descricao'
    ];
}
