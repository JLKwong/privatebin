FROM jleekwong/php-apache:latest

RUN curl -L https://github.com/PrivateBin/PrivateBin/archive/refs/tags/1.3.5.zip > /var/www/1.3.5.zip && \
    apt-get update && \
    apt-get install -y unzip zlib1g-dev libpng-dev php-gd && \
    cd /var/www && \
    unzip -q 1.3.5.zip && \
    rm -rf html && \
    mv PrivateBin-1.3.5 html && \
    mv html/.htaccess.disabled html/.htaccess && \
    a2enmod rewrite && \
    rm -rf master.zip
RUN chmod 777 -R /var/www/html
