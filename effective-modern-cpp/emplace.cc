#include <vector>
#include <regex>

int main()
{
    std::vector<std::regex> regexes;
    regexes.emplace_back(nullptr);      //compile
    regexes.push_back(nullptr);         //compile error

    return 0;
}
