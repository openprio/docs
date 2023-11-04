#!/bin/bash
./install_docker-compose.sh

# Install helpfull utilities.
sudo apt-get install postgresql-client -y
docker network create backend

