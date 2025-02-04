FROM        golang:alpine
#FROM        ubuntu
# RUN         apt-get update -y && apt-get install -y tzdata
# RUN         apt-get install golang -y
#RUN export PATH=$PATH:/usr/local/go/bin
RUN         mkdir -p /go/src
COPY        . /go/src/
WORKDIR     /go/src/
# ENV         GO111MODULE=off
# COPY go.mod ./
# COPY go.sum ./
# RUN go mod download
# RUN         go env -w GO111MODULE=off
# RUN export GOPATH=~/go
# RUN         apt-get install go-dep -y
RUN         go mod init github.com/login
RUN         go get && go build
# RUN         go build
ENV         AUTH_API_PORT=8080
CMD         [ "login" ]

