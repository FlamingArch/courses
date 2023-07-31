#include <stdio.h>

int main()
{
  // Arrays are saved contiguously in the Stack Memory.
  int a[5] = {1, 3, 5, 7, 9};
  int b[5] = {2, 4, 6, 8, 10};

  for (int i = 0; i < 5; i++)
  {
    printf("%d,", a[i]);
  }
  printf("\n");

  for (int i = 0; i < 5; i++)
  {
    printf("%d,", b[i]);
  }
  printf("\n");
}
