#
#
#
#
FROM registry.access.redhat.com/rhel7:latest
MAINTAINER sameer@damagehead.com


RUN yum clean all
RUN yum update -y
RUN yum install bind -y
RUN yum clean all



