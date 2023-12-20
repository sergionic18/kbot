GCP_PROJECT_ID := universal-code-407314

# REGISTRY := sergionic18 
REGISTRY := gcr.io/${GCP_PROJECT_ID}

APP := $(shell basename $(shell git remote get-url origin))
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)

# Default OS and ARCH
TARGETOS ?= linux
TARGETARCH ?= amd64

.PHONY: format lint test get build image push clean linux darwin windows

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

build: format get
#	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags="-X="kbot/cmd.appVersion=${VERSION}

	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags="-X="github.com/sergionic18/kbot/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}  --build-arg TARGETARCH=${TARGETARCH}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

# Specific build targets
linux:
	@$(MAKE) build TARGETOS=linux TARGETARCH=amd64

darwin:
	@$(MAKE) build TARGETOS=darwin TARGETARCH=amd64

windows:
	@$(MAKE) build TARGETOS=windows TARGETARCH=amd64

arm:
	@$(MAKE) build TARGETOS=linux TARGETARCH=arm64

clean:
	rm -rf kbot
	docker rmi -f ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
