OUTPUT_DIR=./bin

GOARCH ?= $(shell go env GOARCH)
GOOS ?= $(shell go env GOOS)

BINARY_NAME=simon
LINUX_BINARY_NAME=simon_linux

all: build

.PHONY: build
build:
	GOARCH=$(GOARCH) GOOS=$(GOOS) go build -v -o $(OUTPUT_DIR)/$(BINARY_NAME) ./cmd

.PHONY: linux_build
linux_build:
	GOARCH=amd64 GOOS=linux go build -v -o $(OUTPUT_DIR)/$(LINUX_BINARY_NAME) ./cmd
	chmod +x $(OUTPUT_DIR)/$(LINUX_BINARY_NAME)