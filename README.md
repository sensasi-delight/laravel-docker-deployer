# Laravel Docker Deployer

Just a docker-compose file for the easiest Laravel application deployment with PHP, MySQL and NGINX (LEMP) stack. From git hosting to your production machine under Docker environment. Optimized for Laravel production environment.

> This document is also available in another languages, please visit the [readmes folder](readmes/).

## Features

- Easy-to-use
- Clone from Git or copy from local automatically.
- Support multi database.
- Available PHP version
	- [x] 7.4-fpm.
	- [x] 7.4-fpm-alpine.
	- [x] 8.0-fpm.
	- [x] 8.0-fpm-alpine.
	- [x] 8.1-fpm.
	- [x] 8.1-fpm-alpine.

Any suggestion? [open new issue!](../../issues).

## How to use

> Make sure the Docker has been installed on your system. If the Docker is not installed yet, please visit [this link](https://docs.docker.com/engine/install/) for installation guide.

> Also make sure the directory structure of your Laravel application is complies to the [Laravel default structure](https://laravel.com/docs/structure).


1. Clone or download this repository.
2. Copy the `.env.example` and rename to `.env`, fill all variables that you need for your Laravel application on production environment. All mandatory and optional variables has been described inside the file.
3. Run `docker-compose up -d` and wait until all containers has been started.
4. Done 🎉 your application has been served on your machine by now.

## .env Variables

As you can see, this repository have the `.env.example` file for basic guide of create you `.env` file.
The `.env` file is used for both Laravel Docker Deployer and your Laravel App.
The list of `.env` variables that used by Laravel Docker Deployer are shown on the table below:

| Variable           | Default | Description                                                                                                                                                                                                                                                                                                                                                                                 |
|--------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PHP_VERSION        |         | Mandatory. All available versions can be seen on: https://hub.docker.com/r/sensasidelight/php-laravel/tags ⚠️ Make sure it's compatible with your Laravel php version.                                                                                                                                                                                                                                                                                |
| MYSQL_VERSION      |         | Mandatory. All available versions can be seen on: https://hub.docker.com/_/mysql/tags                                                                                                                                                                                                                                                                                                                                           |
| NGINX_VERSION      |         | Mandatory. All available versions can be seen on: https://hub.docker.com/_/nginx/tags                                                                                                                                                                                                                                                                                                                                          |
| APP_SRC_GIT        |         | Mandatory if you want to clone the project using git. ⚠️ please deactivate the `APP_SRC_LOCAL` variable if you want to using this. value examples: - https://github.com/[your-username]/[your-project-name] - https://github.com/[your-username]/[your-project-name].git - https://[your-username]:[your-password]@github.com/[your-project-name].git - ../path/to/your/awesome/project/.git |
| APP_SRC_GIT_BRANCH |         | Optional.                                                                                                                                                                                                                                                                                                                                                                                   |
| APP_SRC_LOCAL      |         | Mandatory if you want to copy-paste the project from your local directory. ⚠️ Please deactivate the `APP_SRC_GIT` variable if you want to using this.  example: - ../path/to/your/awesome/project                                                                                                                                                                                            |
| DB_ROOT_PASSWORD   |         | Mandatory.                                                                                                                                                                                                                                                                                                                                                                                  |
| PORT               | 80      | Optional. Binded port on docker host.                                                                                                                                                                                                                                                                                                                                                       |
| SEED_DB            | false   | Optional. Seeding is only for testing. Your production environment shouldn't seed the database. ⚠️ If you are insist to seed the database, make sure all required packages (e.g `faker/faker`) is required on `composer.json`, not on `require-dev`                                                                                                                                                   |
| DB_DATABASE*       | forge   | Optional. If your application use multiple database, just add new `[*]DB_DATABASE[*]` variable on the `.env` file. example: - ***SECOND_***DB_DATABASE=forge_2 - DB_DATABASE***_LOG***=forge_log                                                                                                                                                                                            |
| DB_HOST*           | mysql   | Mandatory. Please don't change the value.                                                                                                                                                                                                                                                                                                                                                   |
| DB_USERNAME*       |         | Mandatory. ⚠️ Please don't fill this variable with `root` value                                                                                                                                                                                                                                                                                                                              |
| DB_PASSWORD*       |         | Mandatory.                                                                                                                                                                                                                                                                                                                                                                                  |

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement". Don't forget to give the project a star! Thanks again!

1. Fork the Project.
2. Create your Feature Branch (`git checkout -b AmazingFeature`).
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the Branch (`git push origin AmazingFeature`).
5. Open a Pull Request.

## License

The code is released under the MIT license.

## Contact

Email - [zainadam.id@gmail.com](mailto:zainadam.id+gh+readme@gmail.com?subject=[GitHub]%20Laravel%20Docker%20Deployer)
