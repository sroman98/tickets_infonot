<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mensaje extends Model
{
    protected $fillable = ['descripcion', 'archivo', 'idTicket', 'idUsuario'];
}
