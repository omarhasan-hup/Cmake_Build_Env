# Define the shell to use
SHELL := /bin/bash

# Text Colors
BLACK = \033[30m
RED = \033[31m
GREEN = \033[32m
YELLOW = \033[33m
BLUE = \033[34m
MAGENTA = \033[35m
CYAN = \033[36m
WHITE = \033[37m

# Background Colors
BG_BLACK = \033[40m
BG_RED = \033[41m
BG_GREEN = \033[42m
BG_YELLOW = \033[43m
BG_BLUE = \033[44m
BG_MAGENTA = \033[45m
BG_CYAN = \033[46m
BG_WHITE = \033[47m

# Bold Text
BOLD = \033[1m
# Reset Color
RESET = \033[0m


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
#navigate to the build dir then run make all and make the target final_elf to generate the elf file and all of this is being logged in the Build_log.txt 
build:
	@echo -e "$(MAGENTA)$(BOLD)navigate to build env directory to start the build process \n $(RESET)"
#perform make all inside the generated cmake build enviromnet with directing all the output either error or correct build to Build_log.txt
	cd $(DIR)/ && (make all 2>&1 || exit 1) | tee -a $(Build_lgs)/Build_log.txt 

	@echo -e "                                                " >> $(Build_lgs)/Build_log.txt
	@echo -e "$(GREEN)$(BOLD)*************End OF build process*************** \n $(RESET)" | tee -a $(Build_lgs)/Build_log.txt
	@echo -e "                                                " >> $(Build_lgs)/Build_log.txt
	
	@echo -e "$(MAGENTA)$(BOLD)************* Start The ELF FILE Generation ***************\n $(RESET)" | tee -a $(Build_lgs)/Build_log.txt
	@echo -e "                                                " >> $(Build_lgs)/Build_log.txt
#Trigger the genertaed target final_elf generation to cretae the elf file from the final object file generted from the make all above and direct the output to the Build_log.txt too 	
	cd $(DIR)/ && (make final_elf 2>&1 || exit 1) | tee -a $(Build_lgs)/Build_log.txt 
	
	@echo -e "                                                " >> $(Build_lgs)/Build_log.txt
	@echo -e "$(GREEN)$(BOLD)**********End OF ELF generation***************\n $(RESET)" | tee -a $(Build_lgs)/Build_log.txt
	
	@echo -e "                                                " >> $(Build_lgs)/Build_log.txt
	@echo -e "$(MAGENTA)$(BOLD)************* Start The HEX FILE Generation ***************\n $(RESET)" | tee -a $(Build_lgs)/Build_log.txt
	
#Trigger the genertaed target final_hex generation to cretae the HEX file from the ELF file above and direct the output to the Build_log.txt too
	cd $(DIR)/ && (make final_hex 2>&1 || exit 1)  | tee -a $(Build_lgs)/Build_log.txt 
	
	@echo -e "                                                " >> $(Build_lgs)/Build_log.txt
	@echo -e "$(GREEN)$(BOLD)*************End OF HEX generation***************\n $(RESET)" | tee -a $(Build_lgs)/Build_log.txt
	@echo -e "\n $(BLUE)$(BOLD)$(BG_WHITE)🎉🎉🎉🎉The Flashable image shall be ready in Build_env path 👉👉👉👉🎉🎉🎉 $(RESET)"

# Target to call clean.sh
clean:
	@echo -e "$(MAGENTA)$(BOLD)navigate to build env directory to wipe it out all\n $(RESET)"
	cd $(DIR) && rm -rf *
	@echo -e "$(GREEN)$(BOLD)The cmake build directory is cleaned🧼🧼\n $(RESET)"
	@echo -e "$(MAGENTA)$(BOLD)navigate to build lgs directory to wipe it out all\n $(RESET)"
	cd $(Build_lgs) && rm -rf *
	@echo -e "$(GREEN)$(BOLD)The Build lgs directory is cleaned too🧼🧼\n $(RESET)"

# Target to call cmake_build.sh
cmake_build:
	@echo -e "$(MAGENTA)$(BOLD)navigate to build env directory to start the Cmake Build environment Generation by excuating the CmakeLists \n $(RESET)"
	cd $(DIR)/ && cmake .. | tee -a $(Build_lgs)/Build_log.txt
	@echo -e "                                                " >> $(Build_lgs)/Build_log.txt
	@echo -e "*************End of the Cmake build Environment Generation***************" >> $(Build_lgs)/Build_log.txt
	@echo -e "                                                " >> $(Build_lgs)/Build_log.txt
	@echo -e "$(GREEN)$(BOLD)Done Generating the Build env🎉🎉\n $(RESET)"

# A target to run all scripts in sequence
rebuild: clean  cmake_build build

Exe:
	@echo "Running final executable..."
	@ls -l $(DIR)/final
	@$(DIR)/final || echo "Error executing final executable"

