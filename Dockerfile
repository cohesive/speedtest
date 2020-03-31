FROM vns3local:vns3_base_1804
SHELL ["/bin/bash", "-c"]
MAINTAINER @cohesivenet

# This copyrighted material is the property of
# Cohesive Flexible Technologies and is subject to the license
# terms of the product it is contained within, whether in text
# or compiled form.  It is licensed under the terms expressed
# in the accompanying README.md and LICENSE.md files.
#
# This program is AS IS and  WITHOUT ANY WARRANTY; without even
# the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.

# Double apt-get update - for some reason the first one errors out.

RUN chsh -s /bin/bash container_admin && apt update
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y nginx php php-fpm nano && \
    apt autoremove -y && \
    apt clean && \
    mkdir -p /var/run/php && \
    mkdir -p /run/php && \
    rm /etc/nginx/sites-available/default && \
    rm /etc/nginx/sites-enabled/default

ADD html /var/www/html/
ADD speedtest_nginx.conf /etc/nginx/sites-available/speedtest
ADD speedtest_supervisord.conf /etc/supervisor/conf.d/speedtest.conf

RUN ln -s /etc/nginx/sites-available/speedtest /etc/nginx/sites-enabled/speedtest && \
    chown -R www-data:root /var/www/html/*
