#include <iostream>
#include <string>

using namespace std;

int numJewelsInStones(string J, string S)
{
  int dic[128] = { 0 };
  for (auto &&s : J) { dic[s] = 1; }

  int ans = 0;
  for (auto &&s : S) {
    if (dic[s] == 1) { ans++; }
  }
  return ans;
}

int main()
{
  cout << numJewelsInStones("aA", "aAAbbbb") << endl;
  return 0;
}