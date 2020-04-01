VERSION:=latest
DOCKER_TAG=saboteurkid/go-demo

.PHONY: clean test build package

clean:
	@rm -f app
	@go clean

test:
	@go test ./... -v 2>&1 | go-junit-report > report.xml

build:
	@CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o app main.go

package:
	docker build -t ${DOCKER_TAG}:${VERSION} -f Dockerfile .
	docker build -t ${DOCKER_TAG}:${VERSION}-debug --build-arg BASE_IMAGE=saboteurkid/ubuntu:18.04-base -f Dockerfile .

run:
	docker run --rm -p 1323:1323 ${DOCKER_TAG}:${VERSION}

debug:
	docker run --rm -p 1323:1323 --entrypoint /bin/bash ${DOCKER_TAG}:${VERSION}-debug

