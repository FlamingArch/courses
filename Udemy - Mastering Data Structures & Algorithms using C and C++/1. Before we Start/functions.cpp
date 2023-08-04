#include <iostream>

typedef struct Rectangle
{
  int length;
  int breadth;
} Rectangle;

void func1();
void func2();
void func3();

int add(int, int);
void swap(int &a, int &b);
int fun(int a[], int n);

int area(Rectangle);
void incrementLength(Rectangle &);

int main()
{
  func1();
  func2();
  func3();

  int x, y, z;
  x = 10;
  y = 5;
  z = add(10, 5); // Actual Parameters
  printf("\n%d\n", z);

  int a = 10;
  int b = 20;
  swap(a, b);
  printf("\nA: %d\nB: %d\n", a, b);

  int arr[] = {1, 2, 3, 4};
  fun(arr, 4);

  return 0;
}

void func1()
{
  printf("Called Function 1\n");
}

void func2()
{
  printf("Called Function 2\n");
}

void func3()
{
  printf("Called Function 3\n");
}

// Cannot use variables of main
// Parameters passed are duplicate in variable in case of pass by value (here)
int add(int a, int b) // Formal Parameters
{
  int c;
  c = a + b;
  return c;
}

// Parameters are passed by reference
// void swap(int *a, int *b)
// {
//   int c = *a;
//   *a = *b;
//   *b = c;
// }
void swap(int &a, int &b)
{
  int c = a;
  a = b;
  b = c;
}
// You cannot swap address instead of values as the address only changes for function variables, and doesn't change the address of variables in the main function itself.
// It also becomes part of the main function.
// Basically becomes monolith of main instead of a function.

// Parameter a is passed by address, n is passed by value. *a can be used instead of a[]
int fun(int a[], int n)
{
  int i;
  a[0] = 69;

  printf("\n");
  for (i = 0; i < n; i++)
    printf("%d,", a[i]);
  printf("\n");

  return *a;
}

int area(Rectangle r)
{
  return r.length * r.breadth;
}

void incrementLength(Rectangle &r)
{
  r.length++;
}
