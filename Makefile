PROJ=buildkit-ssh-sample
VERSION := $(shell date +%Y%m%d)
LDFLAGS = -ldflags "-X main.version=${VERSION}"
PATH = /usr/local/go/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

all: build

.PHONY: build
build: *.go go.mod go.sum
	go build ${LDFLAGS} -o $(PROJ) .
