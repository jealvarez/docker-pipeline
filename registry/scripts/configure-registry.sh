#!/bin/bash

set -x

# Docker Registry
mkdir -p /opt/apps/registry
mv /home/vagrant/docker-compose.yml /opt/apps/registry/
docker-compose -f /opt/apps/registry/docker-compose.yml up -d

# Letsencrypt Certificates
mv /home/vagrant/000-default.conf /etc/apache2/sites-available/
mv /home/vagrant/default-ssl.conf /etc/apache2/sites-available/
mv /home/vagrant/letsencrypt.tar /etc
tar -xvf /etc/letsencrypt.tar --directory /etc/

# Default Credentials Docker Registry
htpasswd -cbB /opt/apps/registry/auth/htpasswd demo demo

# Apache Domain Name
sed -i "s/docker-registry.demo.com/${DOMAIN_NAME}/" /etc/apache2/sites-available/000-default.conf
sed -i "s/docker-registry.demo.com/${DOMAIN_NAME}/" /etc/apache2/sites-available/default-ssl.conf

# Apache Reverse Proxy
a2ensite 000-default.conf default-ssl.conf
systemctl start apache2
