# This is a Dockerfile to create a Makefly environment on Ubuntu 12.04
#
# VERSION 0.0

# use Ubuntu 12.04 image provided by docker.io
FROM ubuntu:12.04

MAINTAINER Olivier Dossmann, olivier+dockerfile@dossmann.net

# Get noninteractive frontend for Debian to avoid some problems:
#    debconf: unable to initialize frontend: Dialog
ENV DEBIAN_FRONTEND noninteractive

# Install wget and dependencies
RUN apt-get install -y wget unzip lua5.1 liblua5.1-filesystem0 liblua5.1-markdown0

# Download and install FAHClient
RUN wget -O makefly_latest.zip "https://github.com/blankoworld/makefly/archive/master.zip" --no-check-certificate \
  && unzip makefly_latest.zip && cd makefly-master && cp makefly.rc.example makefly.rc
