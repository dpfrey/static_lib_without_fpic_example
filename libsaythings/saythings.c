#include <stdio.h>
#include "saythings.h"
#include "greetings.h"

void foo(void)
{
    hello();
    printf("foo in shared lib\n");
}

void bar(void)
{
    printf("bar in shared lib\n");
    goodbye();
}
