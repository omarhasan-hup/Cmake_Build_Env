#include <stdio.h>
#include <assert.h>
#include "SWC_one.h"
#include "mocks/avr/io.h" // This will include the mock io.h

// Test function for set_port initial state
void test_set_port_initial_state() {
    printf("Running test: test_set_port_initial_state\n");
    PORTC = 0x01;
    set_port();
    assert(PORTC == 0x02);
    printf("... PASSED\n");
}

// Test function for the rollover behavior
void test_set_port_rollover() {
    printf("Running test: test_set_port_rollover\n");
    PORTC = 0x80; // Last bit is set
    set_port(); // After shifting 0x80, PORTC becomes 0x00, and the if condition resets it to 0x01.
    assert(PORTC == 0x01);
    printf("... PASSED\n");
}

int main() {
    test_set_port_initial_state();
    test_set_port_rollover();
    printf("All tests passed!\n");
    return 0;
}
