
# Arguments defined in docker-compose.yml
ARG PHP_VERSION

FROM php:$PHP_VERSION

ARG APP_NAME
ARG APP_UID
ARG GIT_REPO_URL

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $APP_UID -d /home/$APP_NAME $APP_NAME
RUN mkdir -p /home/$APP_NAME/.composer && \
    chown -R $APP_NAME:$APP_NAME /home/$APP_NAME

# Set working directory
WORKDIR /var/www



# Clone if folder doesn't exist
RUN if [ ! -d "$APP_NAME" ]; then \
    git clone $GIT_REPO_URL $APP_NAME; \
fi

WORKDIR /var/www/$APP_NAME

# install if vendor folder doesn't exists
RUN if [ ! -d "vendor" ]; then \
    composer install --optimize-autoloader --no-dev; \
fi

RUN chown -R $APP_NAME:www-data bootstrap/cache
RUN chown -R $APP_NAME:www-data storage

RUN chmod -R 775 bootstrap/cache
RUN chmod -R 775 storage

RUN if [ ! -f ".env" ]; then \
    cp .env.example .env; \
    php artisan key:generate; \
fi

RUN cp .env .env_bak

RUN rm .env

RUN php artisan storage:link

# optimization

RUN php artisan config:cache

RUN php artisan route:cache

RUN php artisan view:cache
