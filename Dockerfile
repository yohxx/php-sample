FROM php:8.2-apache
COPY . .

RUN apt -y update && \
    apt -y install git && \
    apt -y install curl && \
    apt -y install vim

RUN echo "alias ll='ls -al --color'" >> ~/.bashrc

# Set the document root to /var/www/app and update permissions
RUN echo '<Directory "/var/www/app">\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
    </Directory>' >> /etc/apache2/sites-available/000-default.conf

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

