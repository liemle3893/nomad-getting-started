# A Simple api which is

1. `/healthz` Return `health` of application. (Always OK)
2. `/metrics` Return `metrics` of application. (Not implemented)
3. `/file` Return file content by request `/file?file=<file-location>`
4. `/env` Return all environments of application.


### To build

```shell script
$ make clean build
```

### Package to docker image

```shell script
# Default VERSION is latest
# If you want to custom VERSION, uncomment the following line
# export VERSION=1.0.0
$ make package # VERSION=${VERSION}
```
