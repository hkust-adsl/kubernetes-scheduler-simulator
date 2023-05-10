OUTPUT_DIR=./bin
BINARY_NAME=simon
LINUX_BINARY_NAME=simon_linux
DARWIN_BINARY_NAME=simon_darwin

.PHONY: darwin_build
darwin_build:
	GOARCH=amd64 GOOS=darwin go build -v -o $(OUTPUT_DIR)/$(DARWIN_BINARY_NAME) ./cmd
	chmod +x $(OUTPUT_DIR)/$(DARWIN_BINARY_NAME)
	rm -f $(OUTPUT_DIR)/$(BINARY_NAME)
	ln -s $(OUTPUT_DIR)/$(DARWIN_BINARY_NAME) $(OUTPUT_DIR)/$(BINARY_NAME)

.PHONY: linux_build
linux_build:
	GOARCH=amd64 GOOS=linux go build -v -o $(OUTPUT_DIR)/$(LINUX_BINARY_NAME) ./cmd
	chmod +x $(OUTPUT_DIR)/$(LINUX_BINARY_NAME)
	rm -f $(OUTPUT_DIR)/$(BINARY_NAME)
	ln -s $(OUTPUT_DIR)/$(LINUX_BINARY_NAME) $(OUTPUT_DIR)/$(BINARY_NAME)

.PHONY: clean_build
clean_build:
	rm -f $(OUTPUT_DIR)/*
