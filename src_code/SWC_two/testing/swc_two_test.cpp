#include "gtest/gtest.h"

extern "C" {
    // Definition for the mocked DDRC register declared in the mock io.h
    uint8_t DDRC;
}

// Forward declaration of the function under test, which is in a .c file
extern "C" {
#include "SWC_two.h"
}

// Test fixture for SWC_two tests
class SWCTwoTest : public ::testing::Test {
protected:
    void SetUp() override {
        // Reset mock register before each test
        DDRC = 0x00;
    }
};

TEST_F(SWCTwoTest, SetPortTwoSetsDDRCToOutput) {
    set_port_two();
    EXPECT_EQ(DDRC, 0xFF);
}
