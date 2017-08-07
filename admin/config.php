<?php

define('HTTP',$_SERVER['HTTP_HOST'].str_replace('/admin','',dirname($_SERVER['PHP_SELF'])));

// HTTP
define('HTTP_SERVER', 'http://'.HTTP.'/admin/');
define('HTTP_CATALOG', 'http://'.HTTP.'/');

// HTTPS
define('HTTPS_SERVER', 'http://'.HTTP.'/admin/');
define('HTTPS_CATALOG', 'http://'.HTTP);

// DIR
define('BASE_DIR', str_replace(DIRECTORY_SEPARATOR.'admin', '', realpath(dirname(__FILE__))));
$imagepath = str_replace('\\', '/', BASE_DIR);


define('DIR_APPLICATION', BASE_DIR.'/admin/');
define('DIR_SYSTEM', BASE_DIR.'/system/');
define('DIR_IMAGE', $imagepath.'/image/');
define('DIR_LANGUAGE', BASE_DIR.'/admin/language/');
define('DIR_TEMPLATE', BASE_DIR.'/admin/view/template/');
define('DIR_CONFIG', BASE_DIR.'/system/config/');
define('DIR_CACHE', BASE_DIR.'/system/storage/cache/');
define('DIR_DOWNLOAD', BASE_DIR.'/system/storage/download/');
define('DIR_LOGS', BASE_DIR.'/system/storage/logs/');
define('DIR_MODIFICATION', BASE_DIR.'/system/storage/modification/');
define('DIR_UPLOAD', BASE_DIR.'/system/storage/upload/');
define('DIR_CATALOG', BASE_DIR.'/catalog/');

define('DIR_KNET', 'C:\xampp\htdocs\baghli/knet/');


// DB
define('DB_DRIVER', 'mysqli');
//define('DB_HOSTNAME', 'localhost');
//public ip 185.96.70.232

define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'baghli-arbash');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');
