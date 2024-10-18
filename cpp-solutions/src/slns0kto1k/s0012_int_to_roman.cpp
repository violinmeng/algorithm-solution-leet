#include "slns0kto1k.h"
#include <map>
#include <string>
#include <array>

std::string intToRomanV1(const int num)
{
  const std::array<std::string, 4> thousands = { "", "M", "MM", "MMM" };
  const std::array<std::string, 10> hundreds = { "", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM" };
  const std::array<std::string, 10> tens = { "", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC" };
  const std::array<std::string, 10> ones = { "", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX" };
  const int C1000 = 1000;
  const int C100 = 100;
  const int C10 = 10;
  return thousands.at(num / C1000) + hundreds.at(num % C1000 / C100) + tens.at(num % C100 / C10) + ones.at(num % C10);
}

std::string intToRoman(const int num)
{

  const std::map<int, std::string> map = { { 1, "I" },
    { 4, "IV" },
    { 5, "V" },
    { 9, "IX" },
    { 10, "X" },
    { 40, "XL" },
    { 50, "L" },
    { 90, "XC" },
    { 100, "C" },
    { 400, "CD" },
    { 500, "D" },
    { 900, "CM" },
    { 1000, "M" } };
  std::string ans;
  int mutNum = num;
  while (mutNum > 0) {
    for (auto map_rit = map.rbegin(); map_rit != map.rend(); ++map_rit) {
      if (mutNum >= map_rit->first) {
        ans += map_rit->second;
        mutNum -= map_rit->first;
        break;
      }
    }
  }
  return ans;
}
