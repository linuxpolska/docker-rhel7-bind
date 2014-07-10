#
# Bind9 in RedHat EL 7
#
FROM registry.access.redhat.com/rhel7:latest

MAINTAINER Grzegorz Halajko <gh@linuxpolska.pl>

RUN yum update -y
RUN yum install bind -y
RUN yum clean all

EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 953/tcp




