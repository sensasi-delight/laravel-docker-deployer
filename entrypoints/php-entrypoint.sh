#!/bin/sh
set -e

# Check if $USER is exists
if [ ! -d /home/$USER/.composer ]; then
	echo "Creating user $USER";
	rm -r /var/www || true;

	# Create system user to run Composer and Artisan Commands
	useradd -G www-data,root -u 1000 -d /home/$USER $USER;

	mkdir -p /home/$USER/.composer;
	mkdir -p /home/$USER/logs;
	chown -R $USER:$USER /home/$USER;
fi

# Check if file composer.json is exists
if [ ! -f "/var/www/composer.json" ]; then
	APP_SRC_GIT=$(cat .env | grep "APP_SRC_GIT=" | grep -v "#" | tail -1 | cut -d '=' -f2);
	APP_SRC_GIT_BRANCH=$(cat .env | grep "APP_SRC_GIT_BRANCH=" | grep -v "#" | tail -1 | cut -d '=' -f2);


	if [ ! -f "/home/$USER/app_src/composer.json" ] && [ ! "$APP_SRC_GIT" ]; then
		echo "Application source is not found!";
		exit 1;
	fi

	if [ -f "/home/$USER/app_src/composer.json" ] && [ "$APP_SRC_GIT" ]; then
		echo "Application source is inconsitent!";
		exit 1;
	fi

	# Copy from /home/$USER/app_src/composer.json
	if [ -f "/home/$USER/app_src/composer.json" ]; then
		echo "Copy Application from local";
		cp /home/$USER/app_src /tmp/laravel-app;
	fi

	# Clone from git
	if [ "$APP_SRC_GIT" ]; then
		echo "Cloning Application from: $APP_SRC_GIT";

		if [ "$APP_SRC_GIT_BRANCH" ]; then
			echo "Branch: ${APP_SRC_GIT_BRANCH}";
			git clone --branch $APP_SRC_GIT_BRANCH $APP_SRC_GIT /tmp/laravel-app;
		else
			git clone $APP_SRC_GIT /tmp/laravel-app;
		fi
	fi

	cp -a /tmp/laravel-app/. /var/www/
	rm -r /tmp/laravel-app

	chown -R $USER:www-data /var/www;
fi

su - $USER

cd /var/www

chmod -R 775 bootstrap/cache
chmod -R 775 storage

if [ ! -d "vendor" ]; then
	echo "Installing packages from composer";
	composer install --optimize-autoloader --no-dev;
fi

php artisan storage:link

DB_DATABASES=$(cat .env | grep DB_DATABASE | grep -v "#" | cut -d '=' -f2)
if [ -z "$DB_DATABASES" ]; then
	echo "Database name is set to forge because is empty";
	DB_DATABASES=forge;
fi


# clear all caches first
php artisan cache:clear
rm -r bootstrap/cache/* 
php artisan config:clear


APP_KEY=$(cat .env | grep "APP_KEY=" | grep -v "#" | tail -1 | cut -d '=' -f2)
if [ -z "$APP_KEY" ]; then
	echo "APP_KEY not found";
	echo "generating APP_KEY";
	php artisan key:generate;
fi

if [ ! -e "/home/$USER/logs/DB_CHECKED" ]; then
	DB_ROOT_PASSWORD=$(cat .env | grep DB_ROOT_PASSWORD= | grep -v "#" | tail -1 | cut -d '=' -f2);
	DB_USERNAME=$(cat .env | grep DB_USERNAME= | grep -v "#" | tail -1 | cut -d '=' -f2);
	DB_PASSWORD=$(cat .env | grep PASSWORD= | grep -v "#" | tail -1 | cut -d '=' -f2);

	php /usr/local/bin/db_checks.php $USER $DB_ROOT_PASSWORD $DB_USERNAME "$DB_DATABASES";
fi

# (re)cache all for optimized
php artisan config:cache
php artisan route:cache
php artisan view:cache || true

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@";
fi

exec "$@"