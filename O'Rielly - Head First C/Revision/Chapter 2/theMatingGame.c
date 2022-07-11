#include <stdio.h>

int main(int argc, char const *argv[])
{
    int contestents[] = {1,2,3};
    int *choice = contestents;
    contestents[0] = 2;
    contestents[1] = contestents[2];
    contestents[2] = *choice;
    // Before Running: Contestent 2.
    printf("I'm going to pick contestent number: %i\n", contestents[2]);
    // After Runnung: Contestent 2. Was right...
    return 0;
}
