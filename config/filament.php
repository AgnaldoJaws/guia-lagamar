<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Dashboard
    |--------------------------------------------------------------------------
    |
    | Here you may configure your Filament dashboard. You may define the
    | dashboard navigation links and other settings related to the dashboard.
    |
    */

    'dashboard' => [

        /*
        |--------------------------------------------------------------------------
        | Navigation
        |--------------------------------------------------------------------------
        |
        | Configure the navigation links of your Filament dashboard here.
        |
        */

        'navigation' => [
            [
                'url' => '/dashboard', // URL do novo item de menu
                'name' => 'Dashboard', // Nome do novo item de menu
                'icon' => 'heroicon-o-home', // Ícone do novo item de menu (consulte https://heroicons.com/ para os nomes dos ícones)
            ],
            // Adicione outros itens de menu conforme necessário
        ],

    ],

];
