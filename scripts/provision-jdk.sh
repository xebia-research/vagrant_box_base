#!/usr/bin/env bash
set -e

# install JDK as it was meant to be - from scratch
echo "Provisioning Java JDK..."
mkdir -p /home/vagrant/java
cd /home/vagrant/java
test -f /tmp/jdk-8-linux-x64.tar.gz || curl -q -L --cookie "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz -o /tmp/jdk-8-linux-x64.tar.gz

sudo mkdir -p /usr/lib/jvm

sudo tar zxf /tmp/jdk-8-linux-x64.tar.gz -C /usr/lib/jvm

# register Java
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_161/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_161/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.8.0_161/bin/javaws" 1

sudo chmod a+x /usr/bin/java
sudo chmod a+x /usr/bin/javac
sudo chmod a+x /usr/bin/javaws
sudo chown -R root:root /usr/lib/jvm/jdk1.8.0_161

#sudo echo -e "export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_101" >> /etc/environment
echo "export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_131" >> /home/vagrant/.zshrc
