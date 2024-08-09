# Define the shell to use
SHELL := /bin/bash


mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))
# Define the path for the build environment path # Define the directory path as a variable
DIR := $(mkfile_dir)/build_env

# Set the build lgs dir to be in the main dir then navigate to the build_lgs
Build_lgs :=$(mkfile_dir)/build_lgs


Diag_print:
	@echo "Makefile Path: $(mkfile_path)"
	@echo "Makefile Directory: $(mkfile_dir)"
	@echo "DIR is : $(DIR)"
# Target to call build.sh
build:
	@echo "navigate to build env directory"
	cd $(DIR)/ && make all | tee -a $(Build_lgs)/Build_log.txt 
	@echo "                                                " >> $(Build_lgs)/Build_log.txt
	@echo "*************End OF build process***************" >> $(Build_lgs)/Build_log.txt
	@echo "                                                " >> $(Build_lgs)/Build_log.txt
	@echo "************* Start The ELF FILE Generation ***************" >> $(Build_lgs)/Build_log.txt
	@echo "                                                " >> $(Build_lgs)/Build_log.txt
	cd $(DIR)/ && make final_elf | tee -a $(Build_lgs)/Build_log.txt 
	@echo "                                                " >> $(Build_lgs)/Build_log.txt
	@echo "*************End OF ELF generation***************" >> $(Build_lgs)/Build_log.txt
	@echo "                                                " >> $(Build_lgs)/Build_log.txt
	@echo "************* Start The HEX FILE Generation ***************" >> $(Build_lgs)/Build_log.txt
	cd $(DIR)/ && make final_hex | tee -a $(Build_lgs)/Build_log.txt 
	@echo "                                                " >> $(Build_lgs)/Build_log.txt
	@echo "*************End OF HEX generation***************" >> $(Build_lgs)/Build_log.txt
#navigate to the build dir then run make all and make the target final_elf to generate the elf file and all of this is being logged in the Build_log.txt 
	@echo "The .out sahll be creted"

# Target to call clean.sh
clean:
	@echo "navigate to build env directory to wipe it out all"
	cd $(DIR) && rm -rf *
	@echo "The cmake build directory is cleaned"
	@echo "navigate to build lgs directory to wipe it out all"
	cd $(Build_lgs) && rm -rf *
	@echo "The Build lgs directory is cleaned too"

# Target to call cmake_build.sh
cmake_build:
	@echo "navigate to build env directory"
	cd $(DIR)/ && cmake .. | tee -a $(Build_lgs)/Build_log.txt
	@echo "                                                " >> $(Build_lgs)/Build_log.txt
	@echo "*************End of the Cmake build Environment Generation***************" >> $(Build_lgs)/Build_log.txt
	@echo "                                                " >> $(Build_lgs)/Build_log.txt
	@echo "Done Buildig the Build env"

# A target to run all scripts in sequence
rebuild: clean  cmake_build build

Exe:
	@echo "Running final executable..."
	@ls -l $(DIR)/final
	@$(DIR)/final || echo "Error executing final executable"