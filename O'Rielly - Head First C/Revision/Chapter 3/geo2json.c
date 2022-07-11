#include <stdio.h>

void stripNewLine(char[]);

int main(int argc, char const *argv[])
{
    float latitude;
    float longitude;
    char info[80];
    int started = 0;
    puts("data=[");
    while (scanf("%f,%f,%79[^\n]", &latitude, &longitude, info) == 3)
    {
        if (started)
            printf(",\n");
        else
            started = 1;
        stripNewLine(info);
        if (latitude > 90 || latitude < -90)
        {
            fprintf(stderr, "Invalid Latitude: %f\n", latitude);
            return 2;
        }
        else if (longitude < -180 || longitude > 180)
        {
            fprintf(stderr, "Invalid Longitude: %f\n", longitude);
            return 2;
        }
        else
            printf("(latitude: %f, longitude: %f, info: '%s')", latitude, longitude, info);
    }
    puts("\n]");
    return 0;
}

void stripNewLine(char a[])
{
    for (int i = 0; a[i] != '\0'; i++)
        if (a[i] == '\n' || a[i] == '\r')
            for (int j = i; a[j] != '\0'; j++)
                a[j] = a[j + 1];
}

char *getString(char message[])
{
    printf(message);
    char *input;
    scanf("%[^'\n']", message);
    stripNewLine(message);
}

