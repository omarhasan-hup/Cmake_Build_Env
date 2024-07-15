cmake_minimum_required(VERSION 3.10)

# Include the toolchain file
include(avr.cmake)

# Target-specific settings
add_definitions(-mmcu=atmega16 -Os)
# Define F_CPU based on your crystal frequency
add_definitions(-DF_CPU=16000000L)  # Replace 16000000L with your actual frequency

message("The compiler path gcc is : ${CMAKE_C_COMPILER}")
message("THE c++ COMPILER PATH IS : ${CMAKE_CXX_COMPILER}")
message("THe Avr Tool chain path is :${AVR_TOOLCHAIN_PATH}")
if(NOT AVR_TOOLCHAIN_PATH STREQUAL "/opt/AVR_Tool_Chain/avr8-gnu-toolchain-linux_x86_64")
  message(FATAL_ERROR "AVR Toolchain path is incorrect. Please set AVR_TOOLCHAIN_PATH to '/opt/AVR_Tool_Chain/avr8-gnu-toolchain-linux_x86_64'.")
endif()
message("Reached here after the version check")
project(cmake_project )
message("Reached the project name")

####################################################################################################################
# Add include directories
# include_directories(${PROJECT_SOURCE_DIR}/src_code/SWC_one)
# include_directories(${PROJECT_SOURCE_DIR}/src_code/SWC_two)
# include_directories(${PROJECT_SOURCE_DIR}/src_code/SWC_three)

# Add source files using glob patterns
# file(GLOB_RECURSE SOURCES "src_code/*.c")

# Add the executable target and include the source files
# add_executable(final ${SOURCES})

# add_executable(final src_code/main.c src_code/SWC_one/SWC_one.c)
####################################################################################################################
# Add include directories
# include_directories(${PROJECT_SOURCE_DIR}/src_code/SWC_one)
# include_directories(${PROJECT_SOURCE_DIR}/src_code/SWC_two)
# include_directories(${PROJECT_SOURCE_DIR}/src_code/SWC_three)


# Add the main source file
add_executable(final
src_code/main.c
)

# Set output formats to generate hex file from the obj
set_target_properties(final PROPERTIES
    SUFFIX ".hex"
    LINK_FLAGS "-Wl,-Map=final.map"
    COMMENT "Generating HEX file..."
)

# Add a custom target for ELF generation
add_custom_target(final_elf
    COMMAND ${CMAKE_C_COMPILER} -mmcu=atmega16 -Wl,-Map=final.map -o final.elf CMakeFiles/final.dir/src_code/main.c.obj
    DEPENDS final
    COMMENT "Generating ELF file..."
    VERBATIM
)


# # Add subdirectories containing SWC CMakeLists.txt files
# add_subdirectory(src_code/SWC_one)
# add_subdirectory(src_code/SWC_two)
# add_subdirectory(src_code/SWC_three)

# Link the SWCs with the main executable
# target_link_libraries(final
# SWC_one
# SWC_two
# SWC_three
# )


#The below line is very risky specially the Tdata part it gives the begging the .data section addresse 
target_link_libraries(final -Wl,-Ttext=0x0000 -Wl,-Tdata=0x800060)
