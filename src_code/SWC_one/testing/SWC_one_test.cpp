#include "gtest/gtest.h"

/*
 * We need to tell the C++ compiler that the functions we are testing
 * are C functions.
 */
extern "C" {
#include "SWC_one.h"
/*
 * We also need to include the mock header for PORTC for the test fixture
 * to be able to access it.
 */
#include "mocks/avr/io.h"
}

/*
 * A test fixture class is created to set up and tear down
 * the test environment. Here we reset PORTC before each test.
 */
class SWCOneTest : public ::testing::Test {
protected:
    void SetUp() override {
        PORTC = 0;
    }
};

/* Test case to check the rolling LED behavior */
TEST_F(SWCOneTest, PortCShiftsLeft) {
    PORTC = 0x01;
    set_port();
    ASSERT_EQ(PORTC, 0x02);
    set_port();
    ASSERT_EQ(PORTC, 0x04);
}

/* Test case to check the wrap-around behavior when PORTC becomes 0 */
TEST_F(SWCOneTest, PortCWrapsAround) {
    PORTC = 0x80; // The last LED is on
    set_port();
    // After shifting left, PORTC becomes 0x00, and the function should reset it to 0x01.
    ASSERT_EQ(PORTC, 0x01);
}
