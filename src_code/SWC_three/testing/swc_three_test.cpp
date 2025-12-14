#include "gtest/gtest.h"
#include <iostream>
#include <string>
#include <cstdio>

// Forward declaration of the function under test, which is in a .c file
extern "C" {
#include "SWC_three.h"
}

class SWCThreeTest : public ::testing::Test {
protected:
    // Helper function to capture stdout
    std::string captureOutput(void (*func)()) {
        testing::internal::CaptureStdout();
        func();
        return testing::internal::GetCapturedStdout();
    }
};

TEST_F(SWCThreeTest, SetPortTreePrintsCorrectMessage) {
    std::string expected_output = "This is the SWC_three print>>>>>>>>>>>>> \r\n";
    std::string actual_output = captureOutput(set_port_tree);
    EXPECT_EQ(actual_output, expected_output);
}
