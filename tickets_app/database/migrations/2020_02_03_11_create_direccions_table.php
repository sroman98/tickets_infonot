<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDireccionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('direcciones', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('calle', 50);
            $table->smallInteger('numExt');
            $table->smallInteger('numInt')->nullable();
            $table->string('colonia', 50);
            $table->smallInteger('cp');
            $table->unsignedBigInteger('idEstado');
            $table->unsignedBigInteger('idMunicipio');

            $table->foreign('idEstado')->references('id')->on('estados');
            $table->foreign('idMunicipio')->references('id')->on('municipios');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('direccions');
    }
}
