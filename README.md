docker-rhel7-bind
=================

Docker contrainer with Red Hat Enterprise Linux 7 and Bind9

# Introduction
Dockerfile to build a bind9 dns server on RHEL 7 Container with bind configuration files in shared volume.

# Instalation docker on RedHat EL 7

```
subscription-manager register --username=rhnuser --password=rhnpasswd
subscription-manager list --available  Find pool ID for RHEL subscription
subscription-manager attach --pool=pool_id
subscription-manager repos --enable=rhel-7-server-extras-rpms
subscription-manager repos --enable=rhel-7-server-optional-rpms
yum install docker 
```
And if you want local registyr

```
yum install docker-registry
```

Pull images from Red Hat Repository 

```
docker pull registry.access.redhat.com/rhel
```

# Installation
Build the image yourself

```
git clone https://github.com/linuxpolska/docker-rhel7-bind.git docker-rhel7-bind.git
./docker-bind-build.sh
```
Script `docker-bind-build.sh` will build the `inuxpolska/docker-rhel7-bind` image. 

# Quick Start
To quick start run
```
docker run --name='rhel7-bind9' -d -p 53:53/udp linuxpolska/docker-rhel7-bind:latest
```
Container will be strated with default configuration from Ubuntu.

For advanced users please check `docker-bind-start.sh`.
```
./docker-bind-start.sh
```

# Data Store
You can mount external configuration file. Mount volumen `/opt/data` with configuration. If this is empty directory container make copy default configuration.
You can copy my configuration from github
```
git clone git clone https://github.com/linuxpolska/docker-rhel7-bind.git docker-rhel7-bind.git
cd docker-rhel7-bind.git 
cp -r ./docker /opt
```
and run docker with
```
docker run .... -v /opt/docker/:/opt/data:rw 
```
