#include "SWC_one.h"

void set_port(void)
{
    _delay_ms(500);
    PORTC = (PORTC << 1); // every time only one led is ON
    if (PORTC == 0x00)
    {
        /* In case PORTC equals ZERO after 8 shifts
         * turn on the first led to start rolling again */
        PORTC = 0x01;
    }
}