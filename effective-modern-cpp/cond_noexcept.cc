#include <iostream>
#include <cstddef>
#include <array>
#include <algorithm>

template <class T, std::size_t N>
void my_swap(std::array<T, N>(&a), std::array<T, N>(&b)) noexcept(noexcept(std::swap(a[N], b[N])))
{
    for (int i = 0; i < N ; i++) {
        std::swap(a[i], b[i]);
    }
}

int main()
{
    std::array<int, 3> a = {1,2,3};
    std::array<int, 3> b = {4,5,6};

    my_swap(a, b);

    for (auto&&i: a) {
        std::cout << i << " ";
    }

    return 0;
}
