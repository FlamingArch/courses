#include <stdio.h>
#include <string.h>

char tracks[][80] = {
    "I left my Heart in Harvard Med School",
    "Newark, Newark - a wonderful town",
    "Dancing with a Dork",
    "From here to maternity",
    "The girl from Iwo Jima",
};

void find_track(char[]);
void stripNewLine(char[]);

int main(int argc, char const *argv[])
{
    char name[79];
    printf("Search For: ");
    fgets(name, sizeof(name), stdin);
    stripNewLine(name);
    find_track(name);
    return 0;
}

void find_track(char search_for[])
{
    for (int i = 0; i < 5; i++)
        if (strstr(tracks[i], search_for))
            printf("Track %i: %s\n", i + 1, tracks[i]);
}

void stripNewLine(char a[])
{
    for (int i = 0; a[i] != '\0'; i++)
        if (a[i] == '\n' || a[i] == '\r')
            for (int j = i; a[j] != '\0'; j++)
                a[j] = a[j + 1];
}