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

# Background Text Colors
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

# Environment Variable gets the absolute path of your current Makefile so we could use it as a reference 
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
# Environment Variable to store the main Repo Directory for refernce of any other Dir
mkfile_dir := $(dir $(mkfile_path))
#Envronment variable for the Build_env Directory for refernce 
DIR := $(mkfile_dir)/build_env

# Set the build lgs dir to be in the main dir then navigate to the build_lgs
Build_lgs :=$(mkfile_dir)/build_lgs

# Set this Environment Variable to be used for the Source Simulink Model files  
Model_SOURCE_DIR := $(mkfile_dir)Simulink_Model_sorce/Source_Model/Controller_ert_rtw/

# Set this Environment Variable to be used for the Model_Swc and navigte to the genereated data from the Model  
Model_DEST_DIR := $(mkfile_dir)src_code/Model/Model_gen_data

# Create a Local Environment Variable Holding List of the Newly generated files in the Model Repo 
FILES := $(shell find $(Model_SOURCE_DIR) -type f \( -name "*.c" -o -name "*.h" \) -printf "%P\n")

# Create a new environment variable excluding ert_main.c from the Variable containg the List of all the generated model files in the model repo 
FILTERED_FILES := $(filter-out ert_main.c, $(FILES))


Diag_print:
	@echo "Makefile Path     : $(mkfile_path)"
	@echo "Makefile Directory: $(mkfile_dir)"
	@echo "DIR is            : $(DIR)"
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
full_build: clean  cmake_build build

Exe:
	@echo "Running final executable..."
	@ls -l $(DIR)/final
	@$(DIR)/final || echo "Error executing final executable"



Model_clean:

	@rm -rf $(Model_DEST_DIR)/*  # Remove everything INSIDE Model_DEST_DIR
	@echo "Removed old .c and .h files from $(Model_DEST_DIR)"


Model_copy:
	@mkdir -p $(Model_DEST_DIR)
	@echo "Created a new Dir for the Model Gen data "
	@echo -e  "$(BG_WHITE) $(GREEN) $(BOLD) ####### New Generated Model Files : #############$(RESET)"  
	@echo -e "$(BOLD)$(MAGENTA)$(FILTERED_FILES)$(RESET)"              # Print the contents of FILES
	@echo -e "$(BG_WHITE) $(RED) $(BOLD) Do Not forget to Add them to the CMakeLists of the Model $(RESET)"  
	@for file in $(FILES); do \
		cp $(Model_SOURCE_DIR)/$$file $(Model_DEST_DIR)/$$file; \
	done
	@echo "Copied .c and .h files from $(Model_SOURCE_DIR) to $(Model_DEST_DIR)"

uint_test: clean
	@echo -e "$(MAGENTA)$(BOLD)navigate to build env directory to start the Cmake Build environment Generation for the uint test by excuating the CmakeLists \n $(RESET)"
	@mkdir -p $(mkfile_dir)/test_reports
	@# Configure, build, and test all from within the build directory
	@( \
		cd $(DIR)/ && \
		( \
			echo -e "Configuring for a native test build..." && \
			cmake .. -DBUILD_TESTING=ON -DCMAKE_TOOLCHAIN_FILE="" && \
			echo -e "\nBuilding the test executables..." && \
			cmake --build . && \
			echo -e "\nRunning the tests and generating JUnit XML report..." && \
			ctest --verbose --output-junit "$(mkfile_dir)/test_reports/results.xml" \
		) \
	) 2>&1 | tee -a $(Build_lgs)/Build_log.txt
	@echo -e "$(MAGENTA)$(BOLD)Generating HTML report from test results...\n $(RESET)"
	@junit2html $(mkfile_dir)/test_reports/results.xml $(mkfile_dir)/test_reports/results.html || echo -e "$(RED)Failed to generate HTML report. Is junit2html installed? (pip install junit2html)$(RESET)"
	@echo -e "$(GREEN)$(BOLD)Done with Unit Test Target🎉🎉 HTML report is available at test_reports/results.html\n $(RESET)"