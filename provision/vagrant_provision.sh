#!/usr/bin/env bash

echo "Provisioning"

echo "Installing Nginx"
apt-get install nginx -y > /dev/null

echo "Updating PHP repository"
apt-get install python-software-properties build-essential -y > /dev/null
add-apt-repository ppa:ondrej/php5 -y > /dev/null
apt-get update > /dev/null

echo "Installing PHP"
apt-get install php5-common php5-dev php5-cli php5-fpm -y > /dev/null

echo "Installing PHP extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y > /dev/null

echo "Configuring Nginx"
cp /vagrant/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-available/default

if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

service nginx restart > /dev/null