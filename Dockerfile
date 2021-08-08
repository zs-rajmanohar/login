FROM        golang:1
#FROM        ubuntu
# RUN         apt-get update -y && apt-get install -y tzdata
# RUN         apt-get install golang -y
#RUN export PATH=$PATH:/usr/local/go/bin
RUN         mkdir -p /go/src
COPY        . /go/src/
WORKDIR     /go/src/
#RUN export GOPATH=~/go
# RUN         apt-get install go-dep -y
RUN         go mod init login
RUN         go get && go build
CMD         [ "login" ]
