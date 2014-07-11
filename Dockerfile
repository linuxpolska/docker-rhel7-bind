#
# Bind9 in RedHat EL 7
#
FROM registry.access.redhat.com/rhel7:latest

MAINTAINER Grzegorz Halajko <gh@linuxpolska.pl>

RUN yum update -y
RUN yum install bind -y
RUN yum clean all

#
# Backup exist files
#
RUN mkdir /opt/named.backup
RUN cp --parents /etc/named.* /opt/named.backup/
RUN cp -r --parents  /var/named/ /opt/named.backup
RUN rm -f /etc/named.*
RUN rm -fr /var/named

VOLUME ["/opt/data"]

RUN ln -fs /opt/data/etc/named.conf /etc/named.conf
RUN ln -fs /opt/data/etc/named.iscdlv.key /etc/named.iscdlv.key
RUN ln -fs /opt/data/etc/named.rfc1912.zones /etc/named.rfc1912.zones
RUN ln -fs /opt/data/etc/named.root.key /etc/named.root.key
RUN ln -fs /opt/data/var/named/ /var/named
RUN ln -fs /opt/data/etc/rndc.key /etc/rndc.key

EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 953/tcp

ADD include/named-start /bin/named-start
RUN chmod 755 /bin/named-start

ENTRYPOINT ["/bin/named-start","-g"]
CMD ["-4","-u","named"]






