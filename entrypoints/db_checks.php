<?php

$APP_NAME = $argv[1];
$ROOT_PASSWORD = $argv[2];
$MYSQL_USER = $argv[3];
$DATABASE_NAME = $argv[4];

$dbh = new PDO("mysql:host=$APP_NAME-mysql", 'root', $ROOT_PASSWORD);

$databases = explode(' ', $DATABASE_NAME);

$query = '';
$where = [];

foreach($databases as $dbName) {
	$query .= "CREATE DATABASE IF NOT EXISTS $dbName;
		GRANT ALL PRIVILEGES ON $dbName.* TO '$MYSQL_USER'@'%';";

	$where[] = "TABLE_SCHEMA = '$dbName'";
}

$query .= 'FLUSH PRIVILEGES';


echo "creating and granting databases if is not exists\n";
$dbh->exec($query);

$where = implode(' or ', $where);

print_r("checking db table(s)\n");
$nRows = $dbh->query("SELECT count(*) FROM INFORMATION_SCHEMA.TABLES WHERE $where")->fetchColumn();
	
if ($nRows < 2) {
	print_r("migrating db\r\n");
	passthru('php artisan migrate --force');
}