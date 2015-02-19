#include <iostream>

class Foo {
public:
    template <typename T>
    explicit Foo(T&& f) { std::cout << "universal ref" << std::endl; }

    Foo(const Foo& f) { std::cout << "copy constructor" << std::endl; }
    Foo(Foo&& f) { std::cout << "move constructor" << std::endl; }
};

int main() {
    Foo a(1);
    const Foo ac(1);

    auto b(a);
    auto bc(ac);

    return 0;
}
