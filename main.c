#include <stdio.h>
#include <stdlib.h>

int g_flag = 1;

int test_out(void)
{
    printf("hello world!");
    return 0;
}

int main(void)
{
    printf("hello world!");
    test_out();
    return 0;
}
