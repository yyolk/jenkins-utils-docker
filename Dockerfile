FROM jenkins:latest
MAINTAINER Joseph Yølk Chiocchi <joe@yolk.cc>
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-pip jshon npm maven2 && rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN pip3 install awscli

ENV PACKER_SHA 2d5fb2144eb646ad4fc0f468926f37c73dd89661
ENV PACKER_VERSION 0.8.6
ENV PACKER_ZIP packer_0.8.6_linux_amd64.zip

ADD https://releases.hashicorp.com/packer/0.8.6/packer_0.8.6_linux_amd64.zip /var/jenkins_home
RUN echo "$PACKER_SHA /var/jenkins_home/$PACKER_ZIP" | sha1sum -c -
RUN unzip /var/jenkins_home/$PACKER_ZIP -d /usr/local/bin

USER jenkins