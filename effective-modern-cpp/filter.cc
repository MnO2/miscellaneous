#include <vector>
#include <functional>

int main()
{
    using FilterContainer = std::vector<std::function<bool(int)> >;

    FilterContainer filters;
    int divisor = 2;
    filters.emplace_back([divisor = divisor](int value) { return value % divisor == 0; });

    return 0;
}
