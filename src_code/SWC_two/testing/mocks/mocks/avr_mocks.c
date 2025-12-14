#include <stdint.h>

/* Definition of the mocked PORTC variable */
uint8_t PORTC = 0;

/* Mock implementation of _delay_ms. It does nothing. */
void _delay_ms(double ms) {
    (void)ms; // Avoid unused parameter warning
}
