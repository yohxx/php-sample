FROM php:8.0-apache

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set the document root to /var/www/app and update permissions
RUN sed -i 's!/var/www/html!/var/www/app!g' /etc/apache2/sites-available/000-default.conf \
    && echo '<Directory "/var/www/app">\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
    </Directory>' >> /etc/apache2/sites-available/000-default.conf
