#include <iostream>


int main() {
    int x = 13;
    auto&& y = x;

    std::cout << type_name<decltype(y)>() << std::endl;
}
