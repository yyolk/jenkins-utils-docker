FROM jenkins:latest
MAINTAINER Joseph Yølk Chiocchi <joe@yolk.cc>
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
    python3-pip \
    jshon \
    npm \
    maven2 \
    golang \
    ruby \
    jq \
  && apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -s /usr/bin/nodejs /usr/bin/node


# AWS-CLI
RUN pip3 install awscli
RUN aws configure set preview.cloudfront true


# Packer
ENV PACKER_SHA256=7d51fc5db19d02bbf32278a8116830fae33a3f9bd4440a58d23ad7c863e92e28 \
    PACKER_VERSION=0.10.1 \
    PACKER_ZIP=packer_0.10.1_linux_amd64.zip
ADD https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip /var/jenkins_home/
RUN echo "$PACKER_SHA256 /var/jenkins_home/$PACKER_ZIP" | sha256sum -c -
RUN unzip /var/jenkins_home/$PACKER_ZIP -d /usr/local/bin



USER jenkins
