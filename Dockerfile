FROM php:fpm

# Install Git, Vim
RUN apt-get update && apt-get install -y git vim php5-mysql

# Install required PHP modules
RUN docker-php-ext-install bcmath mbstring pdo_mysql

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV PATH ~/.composer/vendor/bin:$PATH

# Install Symfony installer
RUN curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# Install Laravel installer
RUN composer global require "laravel/installer=~1.1"

# Make working area
RUN mkdir /code
WORKDIR /code
VOLUME /code

# Apply required file permissions
RUN chown -R www-data:www-data /code

# Set timezone
RUN echo 'date.timezone="Europe/Istanbul";' > /usr/local/etc/php/conf.d/php.ini

CMD ["php-fpm"]
