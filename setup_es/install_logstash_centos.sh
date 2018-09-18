#!/usr/bin/env bash

# https://www.elastic.co/guide/en/logstash/current/installing-logstash.html
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

cat >> /etc/yum.repos.d/elasticsearch.repo << EOF
[elasticsearch-6.x]
name=Elasticsearch repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF



sudo yum install logstash

# https://www.elastic.co/guide/en/logstash/6.2/running-logstash.html#running-logstash-upstart
sudo initctl start logstash