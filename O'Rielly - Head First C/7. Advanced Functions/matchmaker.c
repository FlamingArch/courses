#include <stdio.h>
#include <string.h>

//Number of Profiles
int NUM_ADS = 7;

//Profile Descriptions
char *ADS[] = {
    "William: SBM SDOH likes sports, TV, dining",
    "Matt: SWM NS likes art, movies, theater",
    "Luis: SLM ND likes books, theater, art",
    "Mike: DWM DS likes trucks, sports and bieber",
    "Peter: SAM likes chess, working out and art",
    "Josh: SJM likes sports, movies and theater",
    "JED: DBM likes theater, books and dining",
};

// Find someone who likes sports, but not bieber.
int sports_no_bieber(char *s)
{
    return strstr(s, "sports") && !strstr(s, "bieber");
}
// Find someone who likes sports or working out.
int sports_or_workout(char *s)
{
    return strstr(s, "sports") && strstr(s, "workout");
}

// I want a non- smoker who likes the theater.
int ns_theater(char *s)
{
    return strstr(s, "NS") && strstr(s, "theater");
}

// Find someone who likes the arts, theater, or dining.
int arts_theater_or_dining(char *s)
{
    return strstr(s, "arts") || strstr(s, "theater") || strstr(s, "dining");
}

//Filter and display all guys that are into sports, but not into bieber
void find(int (*match)(char *))
{
    int i;
    puts("Search results:");
    puts("--------------------------------------------");

    for (i = 0; i < NUM_ADS; i++)
        if (match(ADS[i]))
            printf("%s\n", ADS[i]);

    puts("--------------------------------------------");
}

int main()
{
    find(sports_no_bieber);
    find(sports_or_workout);
    find(ns_theater);
    find(arts_theater_or_dining);

    return 0;
}