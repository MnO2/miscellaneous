#include <cstdio>

struct A {
  virtual bool operator==(const A&) const {
    std::printf("A::operator==(const A&)\n");
    return true;
  }
  virtual ~A() {}
};

struct B : public A {
  virtual bool operator==(const B&) const {
    std::printf("B::operator==(const B&)\n");
    return true;
  }
  virtual ~B() {}
};

int main() {
  B b1, b2;
  B *pb1 = &b1, *pb2 = &b2;
  A *pa1 = pb1, *pa2 = pb2;
  (*pb1) == (*pb2);
  (*pa1) == (*pa2);
  return 0;
}