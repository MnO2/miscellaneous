#include <vector>
#include <iostream>

template<typename... Ts>
std::vector<int> fwd(Ts&&... params)
{
    return std::vector<int>(std::forward<Ts>(params)...);
}

template<typename... Ts>
std::vector<int> fwd2(Ts&&... params)
{
    return std::vector<int>{std::forward<Ts>(params)...};
}

int main()
{
    auto&& v = fwd(2, 3);
    auto&& v2 = fwd2(2, 3);

    for (auto&& i: v) {
        std::cout << i << " ";
    }
    std::cout << std::endl;

    for (auto&& i: v2) {
        std::cout << i << " ";
    }
    std::cout << std::endl;

    return 0;
}
