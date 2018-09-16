all: build

.PHONY: clean
clean:
	rm -rf torb

deps:
	gb vendor restore

.PHONY: build
build:
	GO111MODULE=auto GOPATH=`pwd`:`pwd`/vendor go build -v torb
