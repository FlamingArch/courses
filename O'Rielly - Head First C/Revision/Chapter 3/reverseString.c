#include <stdio.h>
#include <string.h>

void print_reverse(char *s)
{
    size_t len = strlen(s);
    char *t = s + len - 1;
    while (t >= s)
    {
        printf("%c", *t);
        t = t - 1;
    }
    puts("");
}

int main(int argc, char const *argv[])
{
    char input[80];
    printf("Enter String to be Reversed: > ");
    scanf("%79s", input);
    printf("String Reversed:");
    print_reverse(input);
    return 0;
}
