#include <stdio.h>

void stripNewLine(char[]);

int main(int argc, char const *argv[])
{
    float latitude, longitude;
    char info[80];
    while (scanf("%f,%f,%79[^\n]", &latitude, &longitude, info))
        if ((latitude > 26 && latitude < 34) && (longitude < -64 && longitude > -76))
            printf("%f,%f,%s\n", latitude, longitude, info);
    return 0;
}

void stripNewLine(char a[])
{
    for (int i = 0; a[i] != '\0'; i++)
        if (a[i] == '\n' || a[i] == '\r')
            for (int j = i; a[j] != '\0'; j++)
                a[j] = a[j + 1];
}