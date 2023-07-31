#include <stdio.h>
#include <stdlib.h>

typedef struct Rectangle
{
  int length;
  int breadth;
} Rectangle;

// A program cannot directly access heap memory, it can only access code section and stack memory.
// A pointer allows a program to access the heap memory.
// It also allows it to access resources and for parameter passing.
// It takes the same amount of memory as int does.
int main(int argc, char const *argv[])
{
  int a = 10;  // 2 Bytes
  int *p = &a; // 2 Bytes
  // int &r = a; // C++: Pointing to same address, since they store the same address;

  printf("%d", *p);

  int *h = (int *)malloc(5 * sizeof(int));

  // Pointer in C++
  // DataType hCPP = new DataType[5];

  Rectangle rect = {10, 5};
  Rectangle *pRect = &rect;

  const int breadth = (*pRect).breadth; // Or the simplified Arrow Syntax:
  const int length = pRect->length;

  Rectangle *pHeapRect = (Rectangle *)malloc(sizeof(Rectangle));
  pHeapRect->length = 5;
  pHeapRect->breadth = 10;

  return 0;
}
