# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/media/omar/Local Disk/repoes/cmake_project"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/media/omar/Local Disk/repoes/cmake_project/build_env"

# Include any dependencies generated for this target.
include CMakeFiles/final.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/final.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/final.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/final.dir/flags.make

CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.o: ../src_code/SWC_one/SWC_one.c
CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.o: CMakeFiles/final.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/media/omar/Local Disk/repoes/cmake_project/build_env/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.o -MF CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.o.d -o CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.o -c "/media/omar/Local Disk/repoes/cmake_project/src_code/SWC_one/SWC_one.c"

CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/media/omar/Local Disk/repoes/cmake_project/src_code/SWC_one/SWC_one.c" > CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.i

CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/media/omar/Local Disk/repoes/cmake_project/src_code/SWC_one/SWC_one.c" -o CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.s

CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.o: ../src_code/SWC_two/SWC_two.c
CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.o: CMakeFiles/final.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/media/omar/Local Disk/repoes/cmake_project/build_env/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.o -MF CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.o.d -o CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.o -c "/media/omar/Local Disk/repoes/cmake_project/src_code/SWC_two/SWC_two.c"

CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/media/omar/Local Disk/repoes/cmake_project/src_code/SWC_two/SWC_two.c" > CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.i

CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/media/omar/Local Disk/repoes/cmake_project/src_code/SWC_two/SWC_two.c" -o CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.s

CMakeFiles/final.dir/src_code/main.c.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src_code/main.c.o: ../src_code/main.c
CMakeFiles/final.dir/src_code/main.c.o: CMakeFiles/final.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/media/omar/Local Disk/repoes/cmake_project/build_env/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/final.dir/src_code/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/final.dir/src_code/main.c.o -MF CMakeFiles/final.dir/src_code/main.c.o.d -o CMakeFiles/final.dir/src_code/main.c.o -c "/media/omar/Local Disk/repoes/cmake_project/src_code/main.c"

CMakeFiles/final.dir/src_code/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/final.dir/src_code/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/media/omar/Local Disk/repoes/cmake_project/src_code/main.c" > CMakeFiles/final.dir/src_code/main.c.i

CMakeFiles/final.dir/src_code/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/final.dir/src_code/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/media/omar/Local Disk/repoes/cmake_project/src_code/main.c" -o CMakeFiles/final.dir/src_code/main.c.s

# Object files for target final
final_OBJECTS = \
"CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.o" \
"CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.o" \
"CMakeFiles/final.dir/src_code/main.c.o"

# External object files for target final
final_EXTERNAL_OBJECTS =

final: CMakeFiles/final.dir/src_code/SWC_one/SWC_one.c.o
final: CMakeFiles/final.dir/src_code/SWC_two/SWC_two.c.o
final: CMakeFiles/final.dir/src_code/main.c.o
final: CMakeFiles/final.dir/build.make
final: CMakeFiles/final.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/media/omar/Local Disk/repoes/cmake_project/build_env/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable final"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/final.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/final.dir/build: final
.PHONY : CMakeFiles/final.dir/build

CMakeFiles/final.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/final.dir/cmake_clean.cmake
.PHONY : CMakeFiles/final.dir/clean

CMakeFiles/final.dir/depend:
	cd "/media/omar/Local Disk/repoes/cmake_project/build_env" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/media/omar/Local Disk/repoes/cmake_project" "/media/omar/Local Disk/repoes/cmake_project" "/media/omar/Local Disk/repoes/cmake_project/build_env" "/media/omar/Local Disk/repoes/cmake_project/build_env" "/media/omar/Local Disk/repoes/cmake_project/build_env/CMakeFiles/final.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/final.dir/depend
