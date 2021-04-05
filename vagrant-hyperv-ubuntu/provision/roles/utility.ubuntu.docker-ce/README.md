utility.docker-ce
=========
The ansible role will perform the following:
* Install specific Docker Engine - Community version (18 or above) on CentOS from RPM package. The older versions of Docker were called docker or docker-engine.
* Install specified docker-machine and docker-compose versions. 
* Setup insecure docker registry.

Below is the list of default variables:
```
container_user: "container"
container_group: "container"
container_uid: "20000"
container_gid: "20000"

docker_daemon_net: "172.50.0.1/16"
docker_fixed_cidr: "172.50.0.0/16"
docker_registry_port: "5000"
docker_compose_version: "1.24.1"
docker_machine_version: "0.16.2"
docker_ce_version: "19.03.2"

host_name: "localhost"
```

Upon installation, you may list the available versions of Docker Engine - Community in the repo:
```
yum list docker-ce --showduplicates | sort -r
```

Requirements
--------------

* CentOS 7
* Ensure centos-extra repository is enabled (default)
* Ensure the system is not installed with any older versions of docker. IF yes, please uninstall by the following command:
    ```
    $ sudo yum remove docker \
                    docker-client \
                    docker-client-latest \
                    docker-common \
                    docker-latest \
                    docker-latest-logrotate \
                    docker-logrotate \
                    docker-engine
    ```
    The contents of /var/lib/docker/, including images, containers, volumes, and networks, are preserved

Role Variables
--------------

```
{{ container_user }} # User inside container
{{ container_group }} # Group inside container
{{ container_uid }} # Container user id
{{ container_gid }} # Container group id

{{ docker_daemon_net }} # Docker daemon network, for example 172.50.0.1/16
{{ docker_fixed_cidr }} # Docker fixed cidr, for example 172.50.0.0/16
{{ docker_registry_port }} # Local docker insecure registry port, for example port 5000
{{ docker_compose_version }} # Docker compose version, for example 1.24.1
{{ docker_machine_version }} # Docker machine version, for example 0.16.2
{{ docker_ce_version }} # Docker machine version, for example 19.03.2

{{ host_name }} # Docker registry host name
```

Dependencies
--------------


Example Playbook
--------------

