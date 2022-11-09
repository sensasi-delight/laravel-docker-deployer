# Laravel Docker Deployer

Just a docker-compose file for easier Laravel application deployment with PHP, MySQL and NGINX stack. From git hosting to your production machine under Docker environment.

## Features

- Easy-to-use
- Multi database

### Planned
- Various Docker image flavours.
- Support private repository.

Any suggestion? [open new issue!](issues).

## Tested Works Image Flavours

- PHP
	- 7.4-fpm
- MySql
	- 8.0
- Nginx
	- alpine

## Prerequisite

- Make sure your project repository is hosted on GitHub.
- `.env.example` file for your laravel application is exists on your project repository.

## How to use

1. Edit `.env` file for docker-compose configuration.
```env
APP_NAME=sensasi-logistic
GIT_REPO_URL=https://github.com/sensasi-apps/sensasi-logistic

DB_DATABASE=sensasi_logistic_mis_data
MYSQL_ROOT_PASSWORD=root
MYSQL_USER=sensasilog
MYSQL_PASSWORD=sensasilog
```
2. Build your docker image for your application using this command: `docker-compose build app`.
3. Finally, bring the services up with this command: `docker-compose up`.

### another useful flags
docker-compose down -v
fresh install

--project-name "first_project"