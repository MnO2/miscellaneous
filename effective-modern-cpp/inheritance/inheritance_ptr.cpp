#include <cstdio>

struct A {
  virtual void f(const A*) const {
    std::printf("A::f(const A*)\n");
  }
  virtual ~A() {}
};

struct B : public A {
  virtual void f(const B*) const {
    std::printf("B::f(const B*)\n");
  }
  virtual ~B() {}
};

int main() {
  B b1, b2;
  B *pb1 = &b1, *pb2 = &b2;
  A *pa1 = pb1, *pa2 = pb2;
  pb1->f(pb2);
  pa1->f(pa2);
  return 0;
}