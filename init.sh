#!/bin/bash
sudo apt-get update -y

# ref: https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04
# Step1 Adding the MongoDB Repository
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update -y

# Step2 Installing and Verifying MongoDB
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

# Step3 Adjusting the Firewall
sudo ufw --force enable
sudo ufw allow 22
sudo ufw allow 27017
sudo ufw reload

cp /vagrant/mongod.conf /etc/mongod.conf
