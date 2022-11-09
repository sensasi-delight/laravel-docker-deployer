#!/bin/sh
set -e

cd /var/www/$APP_NAME

if [ ! -s .env ] && [ -f .env_bak ]; then
	cp .env_bak .env
	rm .env_bak
fi

php /usr/local/bin/db_checks.php $APP_NAME $MYSQL_ROOT_PASSWORD $MYSQL_USER "$DATABASE_NAME"

su - $APP_NAME

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

exec "$@"