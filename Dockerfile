FROM yyolk/jenkins:latest

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-pip jshon && rm -rf /var/lib/apt/lists/*
RUN pip3 install awscli

USER jenkins