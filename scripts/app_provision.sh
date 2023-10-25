#!/bin/bash

# update and upgrade with user input bypass
sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install nginx
sudo apt install nginx -y

# setup nginx reverse proxy
sudo apt install sed

# $ and / characters must be escaped by putting a backslash before them
sudo sed -i "s/try_files \$uri \$uri\/ =404;/proxy_pass http:\/\/localhost:3000\/;/" /etc/nginx/sites-available/default

# restart nginx
sudo systemctl restart nginx

# enable nginx
sudo systemctl enable nginx

# clone app folder from GitHub
git clone https://github.com/AlexAnderson220994/sparta_app.git

# get correct version of Nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# install nodejs
sudo apt install nodejs -y

export DB_HOST=mongodb://<public_IP_of_DB_instance>:27017/posts

# move to folder
cd sparta_app

# move to folder
cd app

# restart nginx
sudo systemctl restart nginx

#npm install
npm install

# seed db
node seeds/seed.js

# pm2 install
sudo npm install pm2 -g

#pm2 kill
pm2 kill

# start app.js
pm2 start app.js