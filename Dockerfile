FROM jenkins:1.609.2

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-pip jshon npm maven2 && rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN pip3 install awscli

USER jenkins