<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

use App\Http\Resources\Municipio as MunicipioResource;
use App\Municipio;

class Direccion extends JsonResource
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
        return [
            'id' => $this->id,
            'calle' => $this->calle,
            'numExt' => $this->numExt,
            'numInt' => $this->numInt,
            'colonia' => $this->colonia,
            'cp' => $this->cp,
            'municipio' => $municipio,
        ];
    }
}
