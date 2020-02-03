<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNotariasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notarias', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->smallInteger('numero');
            $table->char('telefono', 10);
            $table->bigInteger('idMunicipio');
            $table->bigInteger('idDireccion');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('notarias');
    }
}
