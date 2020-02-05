<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    protected $fillable = ['asunto', 'idUsuario', 'idUsAsignado', 'idEstatus', 'idDepartamento', 'idNotaria', 'nombre',
        'telefono', 'correo'];
}
