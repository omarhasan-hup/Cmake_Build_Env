#include <stdio.h>
#include"SWC_one.h"
#include"SWC_two.h"
#include"SWC_three.h"
void (*p2function)(void)=NULL_PTR;
void main (void)
{
    printf("Hello for the first time Cmake \r\n");
    nothing();
    (*p2function)();
    print_func_two();
    print_func_tree();
}