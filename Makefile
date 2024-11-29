# Self-Documenting Makefile
#
# This Makefile is self-documenting. The 'help' target will automatically generate
# a list of available targets with descriptions.
#

# Default target
.PHONY: all
all: build  ## Build all targets (default)

# Build the static library from Go
libgopher.a: gopher.go
	@echo "Building Go static library..."
	go build -buildmode=c-archive -o $@ $<

# Build the Haskell program
Gopher: main.c libgopher.a
	@echo "Building Haskell project..."
	cabal build --extra-lib-dirs=$(PWD)

.PHONY: build
build: libgopher.a Gopher  ## Build the static library and the C program

.PHONY: run
run: Gopher  ## Run the compiled program
	@echo "Running the program..."
	cabal run --extra-lib-dirs=$(PWD)

.PHONY: clean
clean:  ## Remove generated files
	@echo "Cleaning up..."
	git clean -xfd

.PHONY: help
help:  ## Show this help message
	@echo "Usage: make [target]"
	@echo
	@echo "Available targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# Make the help target the first target for ease of use
.DEFAULT_GOAL := help