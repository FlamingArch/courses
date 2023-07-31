#include <stdio.h>

struct Rectangle
{
  int length;  // 2 Bytes
  int breadth; // 2 Bytes
};             // 2 + 2 = 4 Bytes

typedef struct Complex
{
  int real; // 2 Bytes
  int img;  // 2 Bytes
} Complex;  // 2 + 2 = 4 Bytes

int main()
{
  // Structs are saved contiguously in the Stack Memory.
  struct Rectangle r = {10, 5};
  printf("Length: %d, Breadth: %d\nArea: %d\n", r.length, r.breadth, r.length * r.breadth);

  Complex c = {2, 3};
  printf("\nReal Part: %d\nComplex Part:%d\n", c.real, c.img);
}
