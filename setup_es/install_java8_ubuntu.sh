#!/usr/bin/env bash

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie;" http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz
tar -xf jdk-8u171-linux-x64.tar.gz
sudo mkdir -p /usr/lib/jvm/
sudo mv jdk1.8.0_171 /usr/lib/jvm/
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_171/bin/java" 1010
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_171/bin/javac" 1010
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.8.0_171/bin/javaws" 1010
java -version

cat >> /etc/profile.d/javajdk.sh << EOF
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_171
EOF

source /etc/profile.d/javajdk.sh