cmake_minimum_required(VERSION 3.10)
message("Reached here after the version check")
project(cmake_project )
message("Reached the project name")

# Add include directories
include_directories(${PROJECT_SOURCE_DIR}/src_code/SWC_one)
include_directories(${PROJECT_SOURCE_DIR}/src_code/SWC_two)
include_directories(${PROJECT_SOURCE_DIR}/src_code/SWC_three)

# Add source files using glob patterns
file(GLOB_RECURSE SOURCES "src_code/*.c")

# Add the executable target and include the source files
add_executable(final ${SOURCES})

# add_executable(final src_code/main.c src_code/SWC_one/SWC_one.c)
