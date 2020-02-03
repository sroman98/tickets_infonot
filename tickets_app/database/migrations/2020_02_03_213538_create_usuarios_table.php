<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsuariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('correo', 50);
            $table->string('contrasena', 100);
            $table->string('nombre', 50);
            $table->string('apellidos', 50);
            $table->char('telefono', 10);
            $table->binary('foto')->nullable();
            $table->bigInteger('idNotaria')->nullable();
            $table->bigInteger('idDepartamento')->nullable();
            $table->bigInteger('idRol')->nullable();
            $table->timestamps();
            $table->rememberToken();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usuarios');
    }
}
