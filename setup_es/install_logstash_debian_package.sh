#!/usr/bin/env bash
# https://www.elastic.co/guide/en/logstash/current/installing-logstash.html

sudo apt update


# Download and install the public signing key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
# install the apt-transport-https package on Debian before proceeding
sudo apt-get install -y apt-transport-https
# Save the repository definition to /etc/apt/sources.list.d/elastic-6.x.list
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
#  install the logstash Debian package
sudo apt-get update && sudo apt-get install -y logstash


# configure logstash to start automatically when the system boots up
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable logstash.service

# logstash can be started and stopped as follows:
sudo systemctl start logstash.service
# sudo systemctl stop logstash.service
# information see /var/log/logstash/
sudo journalctl --unit logstash



