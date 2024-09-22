#include <iostream>
#include <string>

using namespace std;

bool isPalindrome(string s)
{
  int n = s.size();
  int left = 0, right = n - 1;
  while (left < right) {
    while (left < right && !isalnum(s[left])) { ++left; }
    while (left < right && !isalnum(s[right])) { --right; }
    if (left < right) {
      if (tolower(s[left]) != tolower(s[right])) { return false; }
      ++left;
      --right;
    }
  }
  return true;
}

int main()
{
  cout << (isPalindrome("A man, a plan, a canal: Panama") ? "Yes" : "No") << endl;
  cout << (isPalindrome("race a car") ? "Yes" : "No") << endl;
  return 0;
}