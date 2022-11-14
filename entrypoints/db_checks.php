<?php

declare(strict_types=1);

function fetchColumn(PDO $dbh, string $conditions): int
{
	return (int) $dbh->query("SELECT count(*) FROM INFORMATION_SCHEMA.TABLES WHERE {$conditions}")->fetchColumn();
}

function migrate(): void
{
	print_r("Migrating db\r\n");
	passthru('php artisan migrate --force');
}

$USER 		   = $argv[1];
$ROOT_PASSWORD = $argv[2];
$MYSQL_USER    = $argv[3];
$DATABASE_NAME = $argv[4];

$dbh 		   = new PDO("mysql:host=mysql", 'root', $ROOT_PASSWORD);
$databases     = explode("\n", $DATABASE_NAME);
$query         = '';
$where         = [];

foreach ($databases as $dbName) {
	$query .= "CREATE DATABASE IF NOT EXISTS $dbName;
		GRANT ALL PRIVILEGES ON $dbName.* TO '$MYSQL_USER'@'%';";

	$where[] = "TABLE_SCHEMA = '$dbName'";
}

$query .= 'FLUSH PRIVILEGES';

echo "Creating and granting databases if is not exists\n";

$dbh->exec($query);

$where = implode(' or ', $where);

print_r("Checking db table(s)\n");

if (fetchColumn($dbh, $where) <= 1) {
	migrate();
}

// check if migration is failed
if (fetchColumn($dbh, $where) <= 1) {
	throw new Exception("Migration Failed");
}

touch("/home/$USER/logs/DB_CHECKED");
