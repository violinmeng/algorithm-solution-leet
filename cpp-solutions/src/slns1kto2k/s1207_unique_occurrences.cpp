#include <iostream>
#include <unordered_map>
#include <unordered_set>
#include <vector>

using namespace std;

bool uniqueOccurrences(vector<int> &arr)
{
  unordered_map<int, int> map;
  for (auto &&x : arr) { map[x]++; }

  unordered_set<int> uset;

  for (auto &&m : map) { uset.insert(m.second); }

  return uset.size() == map.size();
}

int main()
{
  vector<int> vec = { 1, 2, 2, 1, 1, 3 };
  cout << (uniqueOccurrences(vec) ? "Yes" : "No") << endl;

  vector<int> vec1 = { 1, 2 };
  cout << (uniqueOccurrences(vec1) ? "Yes" : "No") << endl;

  return 0;
}