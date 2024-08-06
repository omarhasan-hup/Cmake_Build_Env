// #include <stdio.h>
// #include"SWC_one.h"
// #include"SWC_two.h"
// #include"SWC_three.h"
// void main (void)
// {
//     printf("Hello for the first time Cmake \r\n");
//     set_port();
//     set_port_two();
//     set_port_tree();
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

	while (1)
	{

		(void)set_port();
	}
}