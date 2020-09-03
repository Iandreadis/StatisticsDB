FROM ubuntu:latest
MAINTAINER Andreadis Ioannis ioannisandreadis@gmail.com
 
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential
