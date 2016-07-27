<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

require '../vendor/autoload.php';

use \ems\api\filters\AuthFilter as AuthFilter;

$app = new Slim\App();

$app->add(new AuthFilter());

$app->get('/hello/{name}', function ($request, $response, $args) {
    $response->write("api-Hello, " . $args['name']);
    return $response;
});

$app->run();