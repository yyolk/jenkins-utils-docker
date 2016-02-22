FROM jenkins:latest
MAINTAINER Joseph Yølk Chiocchi <joe@yolk.cc>
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-pip jshon npm maven2 golang ruby && rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN pip3 install awscli
RUN aws configure set preview.cloudfront true

ENV PACKER_SHA256=4119d711855e8b85edb37f2299311f08c215fca884d3e941433f85081387e17c \
    PACKER_VERSION=0.8.6 \
    PACKER_ZIP=packer_0.9.0_linux_amd64.zip

ADD https://releases.hashicorp.com/packer/0.9.0/packer_0.9.0_linux_amd64.zip /var/jenkins_home/
RUN echo "$PACKER_SHA256 /var/jenkins_home/$PACKER_ZIP" | sha256sum -c -
RUN unzip /var/jenkins_home/$PACKER_ZIP -d /usr/local/bin

USER jenkins
