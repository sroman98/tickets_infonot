<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\DB;

use App\Http\Resources\Municipio as MunicipioResource;
use App\Municipio;

use App\Http\Resources\Direccion as DireccionResource;
use App\Direccion;

class Notaria extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $municipio = new MunicipioResource(Municipio::find($this->idMunicipio));
        $direccion = new DireccionResource(Direccion::find($this->idDireccion));

        return [
            'id' => $this->id,
            'numero' => $this->numero,
            'telefono' => $this->telefono,
            'notario' => $this->notario,
            'municipio' => $municipio,
            'direccion' => $direccion,
        ];
    }
}
