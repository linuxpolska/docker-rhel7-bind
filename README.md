docker-rhel7-bind
=================

docker-rhel7-bind

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
docker pull registry.access.redhat.com/rhel7
```
...