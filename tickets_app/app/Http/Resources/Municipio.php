<?php

namespace App\Http\Resources;

use App\Http\Resources\Estado as EstadoResource;
use App\Estado;
use Illuminate\Http\Resources\Json\JsonResource;

class Municipio extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $estado = new EstadoResource(Estado::find($this->idEstado));
        return [
            'id' => $this->id,
            'nombre' => $this->nombre,
            'estado' => $estado,
        ];
    }
}
