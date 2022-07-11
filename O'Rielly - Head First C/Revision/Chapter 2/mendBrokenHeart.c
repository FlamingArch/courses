#include <stdio.h>

void skip(char *msg)
{
    puts(msg+6);
}

int main(int argc, char const *argv[])
{
    char *msg_from_amy = "Don't Call Me";
    skip(msg_from_amy);
}