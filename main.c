#include <stdio.h>
#include "saythings.h"

int main(int argc, char **argv)
{
    printf("hello from main()\n");
    foo();
    bar();
    printf("goodbye from main()\n");
    return 0;
}
