#include <stdio.h>
#include"SWC_one.h"
#include"SWC_two.h"
#include"SWC_three.h"
/*Intialze a pointer to function with the same type of the cretaed in the SWC_One to be used with in the mian contexet*/
void (*p2function)(void)=NULL_PTR;
void main (void)
{
    printf("Hello for the first time Cmake \r\n");
    /*Call the function named "p2function_setter" which will set the pointer to function with the required function name  */
    p2function_setter();
    /*Call the pointer to function which in return will call the function in the SWC_One */
    (*p2function)();
    print_func_two();
    print_func_tree();
}