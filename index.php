<?php

    session_start();

    date_default_timezone_set('Europe/Dublin');
    require_once 'config/index.php';

    spl_autoload_register( function( $className ) {

        $fileName = 'controllers/'.$className . '.php';
        if ( file_exists($fileName) ) {
            require $fileName;
        }

    });

    $action = (isset($_GET['action'])) ? $_GET['action'] : '';

    switch ($action) {
        case 'search-news':
            $searchNewsController = new SearchNewsController();
            $searchNewsController->main($_GET);
            break;
        default:
            $mainController = new MainController();
            $mainController->main();
            break;
    }
