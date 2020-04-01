job "demo" {
    datacenters = [
        "dc1"]
    group "api" {
        count = "1"
        task "demo_api" {
            driver = "docker"
            config {
                image = "saboteurkid/go-demo:latest-debug"
                port_map {
                    http = 1323
                }
                sysctl = {
                    "net.core.somaxconn" = "65535"
                }
                ulimit {
                    nofile = "65536"
                    nproc = "8192"
                }
            }
            service {
                name = "go-demo"
                port = "http"
                address_mode = "driver"
                tags = [
                    "traefik.enable=true",
                    "traefik.http.middlewares.strip-go-demo.stripprefix.prefixes=/go-demo",
                    "traefik.http.routers.go-demo.entrypoints=http",
                    "traefik.http.routers.go-demo.rule=PathPrefix(`/go-demo`)",
                    "traefik.http.routers.go-demo.middlewares=strip-go-demo"
                ]
                check {
                    name = "http"
                    type = "http"
                    port = "http"
                    path = "/healthz"
                    timeout = "2s"
                    interval = "5s"
                }
            }
            template {
                data = <<ENV
                    GOMAXPROCS={{ env "attr.cpu.numcores" }}
                ENV
                env = true
                destination = "local/env"
            }
            resources {
                network {
                    port "http" {}
                }
                cpu = "20"
                memory = "20"
            }
        }
    }
}
