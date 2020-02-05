<?php

namespace App\Http\Controllers;

use App\Mensaje;
use App\Ticket;
use Illuminate\Http\Request;
use function foo\func;

class TicketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $ticket = new Ticket;

        if (empty($request->asunto) || empty($request->idDepartamento) || empty($request->idNotaria)) {
            return response()->json(['error' => 'Por favor llena todos los campos'],400);
        }
        if (empty($request->descripcion) && empty($request->archivo)) {
            return response()->json(['error' => 'El mensaje debe tener descripcion o un archivo'],400);
        }

        $ticket->asunto = $request->asunto;
        $ticket->idUsAsignado = null;
        $ticket->idEstatus = 1; // id de estatus 'pendiente'
        $ticket->idDepartamento = $request->idDepartamento;
        $ticket->idNotaria = $request->idNotaria;
        if (empty($request->idUsuario)) {
            if (empty($request->nombre) || empty($request->telefono) || empty($request->correo)) {
                return response()->json(['error' => 'Por favor llena todos los campos'],400);
            } else {
                $ticket->nombre = $request->nombre;
                $ticket->telefono = $request->telefono;
                $ticket->correo = $request->correo;
            }
        } else {
            $ticket->idUsuario = $request->idUsuario;
        }
        if ($ticket->save()) {
            $mensaje = new Mensaje;
            $mensaje->descripcion = $request->descripcion;
            $mensaje->archivo = $request->archivo;
            $mensaje->idTicket = $ticket->id;
            $mensaje->idUsuario = $request->idUsuario;

            if ($mensaje->save()) {
                return response()->json(['ticket' => $ticket, 'mensaje' => $mensaje],200);
            }
            $ticket->delete();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
