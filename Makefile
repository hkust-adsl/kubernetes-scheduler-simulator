OUTPUT_DIR=./bin
BINARY_NAME=simon
LINUX_BINARY_NAME=simon_linux

.PHONY: local_build
local_build:
	GOARCH=amd64 GOOS=darwin go build -v -o $(OUTPUT_DIR)/$(BINARY_NAME) ./cmd

.PHONY: linux_build
linux_build:
	GOARCH=amd64 GOOS=linux go build -v -o $(OUTPUT_DIR)/$(LINUX_BINARY_NAME) ./cmd
	chmod +x $(OUTPUT_DIR)/$(LINUX_BINARY_NAME)
