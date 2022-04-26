FROM golang:1.17 AS build

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update -y && apt-get install -y xz-utils nodejs

COPY . /esm
WORKDIR /esm

RUN --mount=type=cache,target=/go/pkg/mod go build -o bin/esmd main.go

ENTRYPOINT ["/esm/bin/esmd", "--etc-dir", "/esm"]
