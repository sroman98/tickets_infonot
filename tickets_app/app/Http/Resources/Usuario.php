<?php

namespace App\Http\Resources;


use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Notaria as NotariaResource;
use App\Notaria;
use App\Http\Resources\Departamento as DepartamentoResource;
use App\Departamento;
use App\Http\Resources\Rol as RolResource;
use App\Rol;

class Usuario extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $notaria = new NotariaResource(Notaria::find($this->idNotaria));
        $departamento = new DepartamentoResource(Departamento::find($this->idDepartamento));
        $rol = new RolResource(Rol::find($this->idRol));
        return [
            "id" => $this->id,
            "correo" => $this->correo,
            "nombre" => $this->nombre,
            "apellidos" => $this->apellidos,
            "telefono" => $this->telefono,
            "foto" => $this->foto,
            "notaria" => $notaria,
            "departamento" => $departamento,
            "rol" => $rol,
        ];
    }
}
