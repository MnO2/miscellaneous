#include <iostream>
#include <type_traits>
#include <string>

template<typename T>
decltype(auto) my_move(T&& param)
{
    using ReturnType = std::remove_reference_t<T>&&;
    return static_cast<ReturnType>(param);
}

void p(std::string s)
{
    std::cout << s << std::endl;
}

int main()
{
    std::string s("hello world");
    p(my_move(s));
    return 0;
}
