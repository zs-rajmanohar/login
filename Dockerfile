FROM        golang:1.16-alpine
#FROM        ubuntu
# RUN         apt-get update -y && apt-get install -y tzdata
# RUN         apt-get install golang -y
#RUN export PATH=$PATH:/usr/local/go/bin
RUN         mkdir -p /go/src
COPY        . /go/src/
WORKDIR     /go/src/
# COPY go.mod ./
# COPY go.sum ./
# RUN go mod download
RUN         go env -w GO111MODULE=off
RUN export GOPATH=~/go
# RUN         apt-get install go-dep -y
# RUN         go mod init main.go
 RUN         go get && go build
# RUN         go build
CMD         [ "login" ]
