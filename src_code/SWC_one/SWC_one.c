#include"SWC_one.h"
/*Intialed and extern a point to function returning voind and its parmetrers aslo void*/
extern void (*p2function)(void);
void print_func(void)
{
    printf("This is the SWC_one print>>>>>>>>>>> \r\n");
}

/*Mkae a function all its used to init the pointer to the function with a real function path*/
void p2function_setter(void)
{
    p2function = &print_func;

}
