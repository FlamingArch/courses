#include <stdio.h>
#include <string.h>

int main()
{
    int decks;
    puts("Enter Number of Decks");
    scanf("%i", &decks);
    if (decks < 1)
    {
        puts("That is not a valid number of decks.");
        return 1;
    }
    printf("There are %i cards.\n", decks * 54);
    return 0;
}