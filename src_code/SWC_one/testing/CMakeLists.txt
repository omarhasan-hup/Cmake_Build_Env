# This file is processed when BUILD_TESTING is ON

# Add the executable for the tests.
# It includes the test runner, the component source file to be tested,
# and the mock implementation for hardware-specific code.
add_executable(SWC_one_tests
    SWC_one_test.c
    ${CMAKE_SOURCE_DIR}/src_code/SWC_one/SWC_one.c
    mocks/avr_mocks.c
)

# Set the include directories required for the test target.
target_include_directories(SWC_one_tests PRIVATE
    # Directory containing SWC_one.h
    ${CMAKE_SOURCE_DIR}/src_code/SWC_one

    # Directory containing the mocked avr/io.h header
    ${CMAKE_SOURCE_DIR}/src_code/SWC_one/testing/mocks
)

# Add the test to CTest. This allows 'ctest' to discover and run the executable.
add_test(NAME SWC_one_tests COMMAND SWC_one_tests)
