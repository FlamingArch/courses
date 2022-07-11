#include <stdio.h>

void fortune_cookie(char[]);

int main(int argc, char const *argv[])
{
    char quote[] = "Cookies makes you fat";

    fortune_cookie(quote);
    return 0;
}

void fortune_cookie(char msg[])
{
    printf("Message Reads: %s\n", msg);
    printf("Message Occupies: %i bytes\n", sizeof(msg));
}
