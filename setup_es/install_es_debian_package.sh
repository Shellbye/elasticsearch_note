#!/usr/bin/env bash
# https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html

sudo apt update


# Download and install the public signing key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
# install the apt-transport-https package on Debian before proceeding
sudo apt-get install -y apt-transport-https
# Save the repository definition to /etc/apt/sources.list.d/elastic-6.x.list
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
#  install the Elasticsearch Debian package
sudo apt-get update && sudo apt-get install -y elasticsearch

# configure Elasticsearch to start automatically when the system boots up
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service

# Elasticsearch can be started and stopped as follows:
sudo systemctl start elasticsearch.service
# sudo systemctl stop elasticsearch.service
# information see /var/log/elasticsearch/
sudo journalctl --unit elasticsearch

ulimit -n 65536

cat >> /etc/security/limits.conf << EOF
elasticsearch  -  nofile  65536
EOF

# add follow lines into /usr/lib/systemd/system/elasticsearch.service [SERVICE]
# # add according https://www.elastic.co/guide/en/elasticsearch/reference/current/setting-system-settings.html#sysconfig
LimitMEMLOCK=infinity


sudo systemctl daemon-reload
