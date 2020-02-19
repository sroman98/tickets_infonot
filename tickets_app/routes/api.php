<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('tickets', 'TicketController');
Route::resource('notarias', 'NotariaController');
Route::resource('municipios', 'MunicipioController');
Route::resource('estados', 'EstadoController');
Route::resource('usuarios', 'UsuarioController');
Route::resource('rol', 'RolController');
Route::resource('departamento', 'DepartamentoController');

Route::get('/usuarios/notaria/{id}', 'UsuarioController@getNotariaUsers');
