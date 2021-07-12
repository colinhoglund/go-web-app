all: go.mod main.go build/Dockerfile-test

export GIT_ROOT := $(shell git rev-parse --show-toplevel)
export GO_MODULE := $(shell git config --get remote.origin.url | grep -o 'github\.com[:/][^.]*' | tr ':' '/')
export CMD_NAME := $(shell basename ${GO_MODULE})

.PHONY: self-destruct
self-destruct:
	rm Makefile
	cp ./template/Makefile .
	./template/README.md.sh
	rm -rf template/

.PHONY: clean
clean:
	rm -rf go.mod main.go build/ bin/ dist/

go.mod:
	go mod init $(GO_MODULE)

main.go:
	./template/main.go.sh

build/Dockerfile-test:
	mkdir -p build
	./template/Dockerfile-test.sh
