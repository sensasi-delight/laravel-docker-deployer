# Laravel Docker Deployer

Just a docker-compose file for the easiest Laravel application deployment with PHP, MySQL and NGINX (LEMP) stack. From git hosting to your production machine under Docker environment. Optimized for Laravel production environment.

Currently the Laravel Docker Deployer is only has `php:7.4-fpm` which supported for Laravel 6-8. Another flavours still on progress. ~~buy me a coffee~~

> This document is also available on another languages, please visit the [readmes folder](readmes/).

## Features

- Easy-to-use
- Clone from Git or copy from local automatically.
- Support multi database.

### Planned Features

- Various PHP flavours & version.
	- 7.4-fpm-alpine.
	- 8.0-fpm.
	- 8.0-fpm-alpine.
	- 8.1-fpm.
	- 8.1-fpm-alpine.

- Support private repository.

Any suggestion? [open new issue!](../../issues).

## How to use

1. Clone or download this repository.
2. Edit the `.env` file inside this repository, fill all variables that you need for your Laravel application on production environment. All mandatory and optional variables has been described on the `.env` file.
3. Run `docker-compose up --d` and wait for the all containers to be started.
4. Done 🎉 your application has been served on your machine by now.

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
