#include "SWC_one.h"

void set_port(void)
{
    _delay_ms(500);
    if (PORTC == 0x80 || PORTC == 0x00)
    {
        /* If the last LED was on (0x80), or no LEDs were on (0x00),
         * roll over to the first LED. */
        PORTC = 0x01;
    } else {
        PORTC = (PORTC << 1); // every time only one led is ON
    }
}