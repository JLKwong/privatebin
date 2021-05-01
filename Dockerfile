FROM jleekwong/php-apache:latest

RUN curl -L https://github.com/JLKwong/PrivateBin/archive/1.3.1.zip > /var/www/1.3.1.zip && \
    apt-get update && \
    apt-get install -y unzip zlib1g-dev libpng-dev && \
    docker-php-ext-install gd && \
    cd /var/www && \
    unzip -q 1.3.1.zip && \
    rmdir html && \
    mv PrivateBin-1.3.1 html && \
    mv html/.htaccess.disabled html/.htaccess && \
    a2enmod rewrite && \
    rm -rf master.zip
RUN chmod 777 -R /var/www/html
