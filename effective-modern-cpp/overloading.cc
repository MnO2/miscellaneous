#include <iostream>

void f(int a) {
    std::cout << "f(int)" << std::endl;
}

void f(bool a) {
    std::cout << "f(bool)" << std::endl;
}

void f(void *a) {
    std::cout << "f(void*)" << std::endl;
}

int main()
{
    f(0);
    f(NULL);
    f(nullptr);

    return 0;
}
