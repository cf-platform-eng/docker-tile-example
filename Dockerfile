FROM golang
MAINTAINER Ferran Rodenas <frodenas@gmail.com>

# Set environment variables
ENV CGO_ENABLED 0
ENV GOARCH      amd64
ENV GOARM       5
ENV GOOS        linux

# Add files
ADD . /go/src/github.com/cf-platform-eng/docker-tile-example
ADD Dockerfile.final /go/bin/Dockerfile

# Install application
RUN go install github.com/cf-platform-eng/docker-tile-example

# Command to run
CMD docker build -t cfplatformeng/docker-tile-example /go/bin
