# This is a Dockerfile to create a Makefly environment on Debian Wheezy (version 7)
#
# VERSION 0.1

# use Debian wheezy (version 7) image provided by docker.io
FROM debian:wheezy

MAINTAINER Olivier Dossmann, olivier+dockerfile@dossmann.net

# Get noninteractive frontend for Debian to avoid some problems:
#    debconf: unable to initialize frontend: Dialog
ENV DEBIAN_FRONTEND noninteractive

# Update package list before installing ones
RUN apt-get update

# Install program to configure locales
RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
  locale-gen C.UTF-8 && \
  /usr/sbin/update-locale LANG=C.UTF-8
# Install needed default locale for Makefly
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
  locale-gen
# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Install wget and dependencies
RUN apt-get install -y wget unzip lua5.1 liblua5.1-filesystem0 liblua5.1-markdown0

# Download and install FAHClient
RUN wget -O makefly_latest.zip "https://github.com/blankoworld/makefly/archive/master.zip" --no-check-certificate \
  && unzip makefly_latest.zip -d /opt && cd /opt/makefly-master && cp makefly.rc.example makefly.rc

# Delete last makefly zipfile
RUN rm -f /makefly_latest.zip
