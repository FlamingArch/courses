#include <stdio.h>

int main(int argc, char const *argv[])
{
    char s[] = "How big is it?";
    char *t = s;
    printf("Size of s: %d\n",sizeof(s));
    printf("Size of t: %d\n",sizeof(t));

}