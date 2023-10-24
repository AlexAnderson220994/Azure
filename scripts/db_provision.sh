#!/bin/bash

sudo apt update

sudo apt upgrade -y

# Install the version of MongoDB (3.2) required using the following command:

wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -

# Then do the following command:

echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Do sudo apt update again.

sudo apt update

# Specify the components of MongoDB to be installed using the following command:

sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

# Input the following command to alter the IP address for who can connect in the mongodb config:

sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf

echo "Modified MongoDB configuration to allow all connections."

sudo systemctl start mongod

sudo systemctl enable mongod