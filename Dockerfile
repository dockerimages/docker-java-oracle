FROM ubuntu:15.04
MAINTAINER Frank Lemanschik http://github.com/frank-dspeed

ENV LC_ALL      C
ENV JAVA_HOME   /usr/lib/jvm/java-7-oracle

RUN export DEBIAN_FRONTEND=noninteractive \
 && echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu vivid main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
 && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu vivid main" | tee -a /etc/apt/sources.list.d/webupd8team-jav.list \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
 && apt-get update \
 && apt-get upgrade -y \
 && echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
 && apt-get -y \
    oracle-java7-installer \
    oracle-java7-set-default \
 && update-alternatives --display java \
 && rm -rf /var/cache/oracle-jdk7-installer \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
