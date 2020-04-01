# Nomad Getting Started Guide

For those who tired of "The Complex of K8S" or getting familiar with **__Orchestrator__**

### Requirements
- [Docker](https://www.docker.com/) is installed
- [Nomad](https://nomadproject.io/downloads/) is installed
- [Consul](https://www.consul.io/) is installed
- [Levant](https://github.com/jrasell/levant) is installed

#### Bonus: [Vagrant](https://www.vagrantup.com/downloads.html) is installed to learn how to bootstrap nomad cluster


## How to

```shell script
# 1. Start consul
$ consul agent -dev

# 2. Start nomad (in another shell)
$ nomad agent -dev

# 3. Start Traefik as Proxy/Ingress (in another shell)
$ ./jobs/ingress/start-ingress.sh

# 4. Start demo API (Read README.MD at docker/web to understand)
$ ./docker/web/deployment/start.sh


# 5. Finally, check endpoint at
$ curl localhost:38930/go-demo/healthz
$ curl localhost:38930/go-demo/env
$ curl "localhost:38930/go-demo/file?file=local/env"
$ curl localhost:38930/go-demo/metrics

```
