// #include <stdio.h>
// #include"SWC_one.h"
// #include"SWC_two.h"
// #include"SWC_three.h"
// void main (void)
// {
//     printf("Hello for the first time Cmake \r\n");
//     print_func();
//     print_func_two();
//     print_func_tree();
// }

/*****************************************Cross compilation main.c**************************************************************/

#define F_CPU 1000000L

#include <avr/io.h>
#include <util/delay.h>
#include "SWC_one.h"

int main(void)
{
	DDRC = 0xFF; // Configure all PORTC pins as output pins
	/*Call the empty function from the SWC_One*/
	(void)print_func();

	while (1)
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
}