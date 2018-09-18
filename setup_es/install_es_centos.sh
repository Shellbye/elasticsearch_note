#!/usr/bin/env bash

# https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html
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



sudo yum install elasticsearch


cat >> /etc/security/limits.conf << EOF
elasticsearch soft memlock unlimited
elasticsearch hard memlock unlimited
elasticsearch  -  nofile  65536
elasticsearch soft  nproc 65535
elasticsearch hard  nproc 65535
EOF
# https://support.cafex.com/hc/en-us/articles/202508492-Increasing-the-number-of-threads-available-on-Linux

sudo chkconfig --add elasticsearch
sudo -i service elasticsearch start
# sudo -i service elasticsearch stop