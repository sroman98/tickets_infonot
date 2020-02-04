<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTicketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->longText('asunto');
            $table->unsignedBigInteger('idUsuario');
            $table->unsignedBigInteger('idUsAsignado')->nullable();
            $table->unsignedBigInteger('idEstatus');
            $table->unsignedBigInteger('idDepartamento');
            $table->timestamps();

            $table->foreign('idUsuario')->references('id')->on('usuarios');
            $table->foreign('idUsAsignado')->references('id')->on('usuarios');
            $table->foreign('idEstatus')->references('id')->on('estatus');
            $table->foreign('idDepartamento')->references('id')->on('departamentos');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tickets');
    }
}
