#!/usr/bin/bash
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins java-1.8.0-openjdk -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
cd /var/lib/jenkins
#wget http://localhost:8080/jnlpJars/jenkins-cli.jar
#chmod 775 jenkins-cli.jar
#java -jar /var/lib/jenkins/jenkins-cli.jar -s "http://localhost:8080/" install-plugin -source "https://updates.jenkins-ci.org/download/plugins/github-api/" -deploy
#java -jar jenkins-cli.jar -s http://localhost:8080/ -restart
