<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('comercio_subs', function (Blueprint $table) {
            $table->unsignedBigInteger('cities_id')->nullable();
            $table->foreign('cities_id')->references('id')->on('cities');
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::table('comercio_subs', function (Blueprint $table) {
            // Remove a chave estrangeira
            $table->dropForeign(['cities_id']);
        });
    }
};
