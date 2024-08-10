<?php

namespace App\Http\Middleware;

use Closure;

class Cors
{
    public function handle($request, Closure $next)
    {
        $headers = [
            'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods' => 'GET, POST, PUT, DELETE, OPTIONS',
            'Access-Control-Allow-Headers' => 'Content-Type, Authorization',
        ];

        // Verifica se a requisição é preflight (OPTIONS)
        if ($request->isMethod('OPTIONS')) {
            return response()->json('OK', 200, $headers);
        }

        // Adiciona o cabeçalho para permitir apenas origens específicas
        if (strpos($request->header('Origin'), 'http://localhost') === 0) {
            $headers['Access-Control-Allow-Origin'] = $request->header('Origin');
        }

        return $next($request)->withHeaders($headers);
    }
}
