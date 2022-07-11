#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int compare_scores_desc(const void *a, const void *b) { return *(int *)a - *(int *)b; }

int main()
{
    int scores[] = {543, 323, 32, 554, 11, 3, 112};
    int i;
    qsort(scores, 7, sizeof(int), compare_scores_desc);
    puts("There are the scores in order:\n");
    for (int i = 0; i < 7; i++)
        printf("Score: %i\n", scores[i]);
    return 0;
}
