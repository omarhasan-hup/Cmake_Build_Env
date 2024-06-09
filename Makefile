# Define the shell to use
SHELL := /bin/bash

# Default target
all: build

# Target to call build.sh
build:
	@echo "Running build.sh..."
	@./scripts/build.sh

# Target to call clean.sh
clean:
	@echo "Running clean.sh..."
	@./scripts/clean.sh

# Target to call cmake_build.sh
cmake_build:
	@echo "Running cmake_build.sh..."
	@./scripts/cmake_build.sh

# A target to run all scripts in sequence
rebuild: clean  cmake_build build

Exe:
	@echo "Running final excuatable..."
	@./build_env/final

.PHONY: