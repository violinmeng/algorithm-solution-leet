#include <iostream>
#include <string>

using namespace std;

string addBinary(string a, string b)
{

  if (a.length() < b.length()) { return addBinary(b, a); }

  int n = a.length();
  int step = a.length() - b.length();
  int carry = 0;

  string ans(a);
  for (int j = n - 1; j >= 0; j--) {
    carry += (a[j] - '0');
    carry += (j - step >= 0 ? (b[j - step] - '0') : 0);
    ans[j] = carry % 2 + '0';
    carry /= 2;
  }

  if (carry) { ans.insert(ans.begin(), '1'); }

  return ans;
}

int main()
{
  cout << addBinary("11", "1") << endl;

  return 0;
}