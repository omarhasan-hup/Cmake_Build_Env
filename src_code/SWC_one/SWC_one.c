#include"SWC_one.h"
extern void (*p2function)(void);
void print_func(void)
{
    printf("This is the SWC_one print>>>>>>>>>>> \r\n");
}
void nothing(void)
{
    p2function = &print_func;

}
