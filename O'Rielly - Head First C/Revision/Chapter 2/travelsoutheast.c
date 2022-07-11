#include <stdio.h>

void goSouthEast(int *, int *);

int main(int argc, char const *argv[])
{
    int latitude = 32;
    int longitude = -64;
    goSouthEast(&latitude, &longitude);
    printf("Avast! Now at [%i, %i]\n", latitude, longitude);
    return 0;
}

void goSouthEast(int *lat, int *lon)
{
    *lat -= 1;
    *lon += 1;
}
