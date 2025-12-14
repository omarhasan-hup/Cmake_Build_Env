
# Enforce a minimum CMake version.
cmake_minimum_required(VERSION 3.10)

# Include the GoogleTest module which provides helper functions.
include(GoogleTest)

# Define the name for your test executable.
set(TEST_EXECUTABLE_NAME "SWC_three_tests")

# --- TODO: Add your test source files here ---
# List all the source files for your test.
set(TEST_SOURCES
    swc_three_test.cpp
    ../SWC_three.c
)

# Add the executable target for the test.
add_executable(${TEST_EXECUTABLE_NAME} ${TEST_SOURCES})

# Set the include directories required for the test target.
target_include_directories(${TEST_EXECUTABLE_NAME} PRIVATE
    # Directory containing SWC_three.h
    ${CMAKE_SOURCE_DIR}/src_code/SWC_three
)

# Link the test executable against the Google Test and Google Mock libraries.
target_link_libraries(${TEST_EXECUTABLE_NAME} PRIVATE GTest::gtest GTest::gmock GTest::gtest_main)

# Automatically discover all tests defined in the executable.
gtest_discover_tests(${TEST_EXECUTABLE_NAME})
