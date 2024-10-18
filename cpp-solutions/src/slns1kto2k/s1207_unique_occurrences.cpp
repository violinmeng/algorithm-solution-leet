#include <unordered_map>
#include <unordered_set>
#include <vector>
#include "slns1kto2k.h"
using namespace std;

bool uniqueOccurrences(const vector<int> &arr)
{
  unordered_map<int, int> map;
  for (const auto &x : arr) { map[x]++; }

  unordered_set<int> uset;

  for (const auto &ele : map) { uset.insert(ele.second); }

  return uset.size() == map.size();
}