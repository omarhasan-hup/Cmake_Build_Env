# Define the shell to use
SHELL := /bin/bash

# Define the path for the build environment path # Define the directory path as a variable
DIR := /home/oshawky/repoes/cmake_build_env/Cmake_Build_Env/build_env

# Target to call build.sh
build:
	@echo "navigate to build env directory"
	cd $(DIR)/ && make all
	@echo "The .out sahll be creted"

# Target to call clean.sh
clean:
	@echo "navigate to build env directory to wipe it out all"
	cd $(DIR) && rm -rf *
	@echo "The directory is cleaned"

# Target to call cmake_build.sh
cmake_build:
	@echo "navigate to build env directory"
	cd $(DIR)/ && cmake ..
	@echo "Done Buildig the Build env"

# A target to run all scripts in sequence
rebuild: clean  cmake_build build

Exe:
	@echo "Running final executable..."
	@ls -l $(DIR)/final
	@$(DIR)/final || echo "Error executing final executable"