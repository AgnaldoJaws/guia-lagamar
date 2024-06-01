<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AtrativosSubs extends Model
{
    use HasFactory;

    protected $table = 'atrativo_subs';

    public function subCategory()
    {
        return $this->belongsTo(SubCategory::class, 'subcat_id', 'id');
    }
}
