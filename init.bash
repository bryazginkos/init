#!/bin/bash

#urls
IDEA_URL=https://download.jetbrains.com/idea/ideaIU-2016.1.2.tar.gz
TOMCAT_URL=http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-9/v9.0.0.M4/bin/apache-tomcat-9.0.0.M4.zip
JETTY_URL=http://download.eclipse.org/jetty/stable-9/dist/jetty-distribution-9.3.8.v20160314.zip
MAVEN_URL=http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip
SKYPE_URL=https://get.skype.com/go/getskype-linux-beta-ubuntu-64

#path scripts (/ect/profile.d/..)
MAVEN_PATH_SCRIPT=/etc/profile.d/mvn.sh

#java8 install
add-apt-repository -y ppa:webupd8team/java
apt-get update
apt-get -y install oracle-java8-installer

#git
apt-get -y install git

#npm, bower, gulp, http-server
apt-get -y install npm
npm install -g bower
npm install -g gulp
npm install -g http-server
ln -s /usr/bin/nodejs /usr/bin/node 

#Idea
cd /opt
wget $IDEA_URL
IDEA_FILE=$(basename $IDEA_URL)
tar -xzf $IDEA_FILE 
rm $IDEA_FILE

#tomcat
cd /opt
wget $TOMCAT_URL
TOMCAT_FILE=$(basename $TOMCAT_URL)
unzip $TOMCAT_FILE
rm $TOMCAT_FILE 

#jetty
cd /opt
wget $JETTY_URL
JETTY_FILE=$(basename $JETTY_URL)
unzip $JETTY_FILE
rm $JETTY_FILE

#maven
cd /opt
wget $MAVEN_URL
MAVEN_FILE=$(basename $MAVEN_URL)
unzip $MAVEN_FILE
rm $MAVEN_FILE
MAVEN_HOME=/opt/${MAVEN_FILE:0:-8}

echo "MAVEN_HOME=$MAVEN_HOME" >> $MAVEN_PATH_SCRIPT
echo "PATH=\$PATH:\$MAVEN_HOME/bin" >> $MAVEN_PATH_SCRIPT
echo "export PATH" >> $MAVEN_PATH_SCRIPT
source /etc/profile

#browser
apt-get -y install chromium-browser

#keepassx
apt-get -y install keepassx

#dropbox
apt-get -y install nautilus-dropbox

#libreoffice write
apt-get -y install libreoffice-writer

#libreoffice impress
apt-get -y install libreoffice-impress 

#libreoffice calc
apt-get -y install libreoffice-calc 

#krita (graph editor)
apt-get -y install krita

#skype
wget $SKYPE_URL
SKYPE_FILE=$(basename $SKYPE_URL)
dpkg -i $SKYPE_FILE
rm $SKYPE_FILE 

#changing keyboard layout (os freya bug)
gsettings set org.pantheon.desktop.gala.keybindings switch-input-source "['<Alt>Shift_L', '<Alt>Shift_R', '<Shift>Alt_L', '<Shift>Alt_R']"
