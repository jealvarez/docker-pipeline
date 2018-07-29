#!/bin/bash

set -x

# -------------------------------
# Functions
# -------------------------------
append_line_to_file () {
    REPOSITORY="$1"
    FILE="$2"
    grep -qF -- "$REPOSITORY" "$FILE" || echo "$REPOSITORY" >> "$FILE"
}

# Docker
apt-get update -y
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update -y
apt-get install -y docker-ce
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Java
add-apt-repository -y ppa:webupd8team/java
apt-get -y update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java8-installer

# Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
append_line_to_file "deb https://pkg.jenkins.io/debian-stable binary/" /etc/apt/sources.list.d/jenkins.list
apt-get -y update
apt-get install -y jenkins

# Dotnet Core
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get install -y apt-transport-https
apt-get update -y
apt-get install -y dotnet-sdk-2.1

# Ruby + Nodejs
curl -sL https://deb.nodesource.com/setup_8.x | -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
append_line_to_file "deb https://dl.yarnpkg.com/debian/ stable main" /etc/apt/sources.list.d/yarn.list
apt-get update -y
apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

if [ ! -d "/root/.rbenv" ]; then
    git clone https://github.com/rbenv/rbenv.git /root/.rbenv
fi

if [ ! -d "/root/.rbenv/plugins/ruby-build" ]; then
    git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
fi

append_line_to_file 'export PATH="/root/.rbenv/bin:$PATH"' /root/.bashrc
append_line_to_file 'eval "$(rbenv init -)"' /root/.bashrc
append_line_to_file 'export PATH="/root/.rbenv/plugins/ruby-build/bin:$PATH"' /root/.bashrc
source /root/.bashrc
sudo -H -u root bash -i -c 'rbenv install 2.5.1'
sudo -H bash -i -c 'rbenv global 2.5.1'
source /root/.bashrc

# Maven
apt-get install -y maven

# NPM
apt-get install -y npm

# Net Tools
apt-get install -y net-tools
