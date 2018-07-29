#!/bin/bash

set -x

# Repository Manager - Gitlab
mkdir -p /opt/apps/gitlab
mv /home/vagrant/docker-compose.yml /opt/apps/gitlab/
docker-compose -f /opt/apps/gitlab/docker-compose.yml up -d
