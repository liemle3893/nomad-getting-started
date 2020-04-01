ARG BASE_IMAGE=gcr.io/distroless/base
FROM golang:1.14 as builder
COPY . /work
WORKDIR /work

RUN CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o app main.go


FROM $BASE_IMAGE
LABEL maintainer="contact@liemlhd.com"
# Copy Built App
COPY --from=builder --chown=65532:65532 /work/app /app/app
USER nonroot
WORKDIR /app

EXPOSE 1323

ENTRYPOINT ["./app"]