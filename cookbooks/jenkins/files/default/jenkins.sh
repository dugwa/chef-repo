#!/bin/bash

yum install wget -y

wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo

rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key

yum --enablerepo=jenkins install jenkins -y
