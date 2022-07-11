#include <stdio.h>
#include <string.h>

void stripNewLine(char a[])
{
    for (int i = 0; a[i] != '\0'; i++)
        if (a[i] == '\n' || a[i] == '\r')
            for (int j = i; a[j] != '\0'; j++)
                a[j] = a[j + 1];
}

char *getString(char message[], int size)
{
    printf(message);
    static char input[23];
    fgets(input, size, stdin);
    stripNewLine(input);
    return input;
}

char *reversedString(char *s)
{
    const int len = strlen(s);
    static char *reversed;
    s += len - 1;
    for (size_t i = 0; i < len; s--, i++)
    {
        reversed[i] = *s;
    }
    return reversed;
}

int main(int argc, char const *argv[])
{
    char *str = getString("Enter String: > ", 128);
    printf("Entered String: '%s'\n", str);
    printf("Reversed String: '%s'\n", reversedString(str));
    return 0;
    
}
