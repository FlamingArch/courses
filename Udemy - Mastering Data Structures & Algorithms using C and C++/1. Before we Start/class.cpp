#include <iostream>

using namespace std;

class Rectangle
{
private:
  int length;
  int breadth;

public:
  // Constructors
  Rectangle()
  {
    length = breadth = 1;
  }

  Rectangle(int l, int b)
  {
    length = l;
    breadth = b;
  }

  // Methods
  int area();
  int perimeter();

  // Getters
  int getLength()
  {
    return length;
  }

  int getBreadth()
  {
    return breadth;
  }

  // Setters
  void setLength(int l)
  {
    length = l;
  }

  void setBreadth(int b)
  {
    breadth = b;
  }

  // Destructor
  ~Rectangle() {}
};

int Rectangle::perimeter()
{
  return 2 * (length + breadth);
}

int Rectangle::area()
{
  return length * breadth;
}

// Generic Class using Templates
template <class T>
class Arithmetic
{
private:
  T a;
  T b;

public:
  Arithmetic(T a, T b);
  T add();
  T sub();
};

template <class T>
Arithmetic<T>::Arithmetic(T a, T b)
{
  this->a = a;
  this->b = b;
}

template <class T>
T Arithmetic<T>::add()
{
  return a + b;
}

template <class T>
T Arithmetic<T>::sub()
{
  return a - b;
}

int main(int argc, char const *argv[])
{
  Rectangle r1 = Rectangle(10, 5);
  Rectangle r2(3, 2);

  cout << r1.area() << endl;
  cout << r2.perimeter() << endl;

  Arithmetic<int> ar(10, 5);
  cout << ar.add() << endl;

  return 0;
}
