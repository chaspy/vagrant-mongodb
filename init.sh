#!/bin/bash
sudo apt-get update -y

# To avoid error
# Failed global initialization: BadValue Invalid or no user locale set.  Please ensure LANG and/or LC_* environment variables are set correctly. locale::facet::_S_create_c_locale name not valid
# ref: https://www.digitalocean.com/community/questions/how-do-i-access-mongo-shell
grep LC_ALL ~/.bashrc || sudo echo "export LC_ALL=C" >> ~/.bashrc

# ref: https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04
# Step1 Adding the MongoDB Repository
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update -y

# Step2 Installing and Verifying MongoDB
sudo apt-get install -y mongodb-org
sudo systemctl enable mongod

# Step3 Adjusting the Firewall
sudo ufw --force enable
sudo ufw allow 22
sudo ufw allow 27017
sudo ufw reload

IPADDR=$(ip -f inet -o addr show enp0s8|cut -d\  -f 7 | cut -d/ -f 1)
cp /vagrant/mongod.conf /etc/mongod.conf
sudo sed -i "s/IPADDR/$IPADDR/g" /etc/mongod.conf

sudo systemctl start mongod
