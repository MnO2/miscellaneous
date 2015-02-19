#include <vector>
#include <regex>

int main() {
    std::vector<std::regex> regexes;

    regexes.push_back(std::regex("abcde"));
    regexes.emplace_back("edcba");
    regexes.emplace_back(nullptr);

    std::regex a = regexes[2]; //boom
}
