#include <stdio.h>

int main() {
    int n;
    printf("Enter n: ");
    scanf("%d", &n);
    int a[n];
    for (int i = 0; i < n; i++) {
        printf("Enter Element %d: ", i);
        scanf("%d", &a[i]);
    }

    printf("SORTING!!!\n");
    for (int i = 0; i < n; i++)
        for (int j = i + 1; j < n; j++) {
            if (a[i] < a[j]) {
                int tmp = a[i];
                a[i] = a[j];
                a[j] = tmp;
            }
        }

    printf("New Array:");
    for (int i = 0; i < n; i++)
        printf("Element %d: %d\n", i, a[i]);
    return 0;
}
