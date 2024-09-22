#include <iostream>

// clang++ -std=c++11 -stdlib=libc++ -Weverything 0001-twosum.cpp
using namespace std;
// 判断一个数是不是回文数
bool isPalindrome(int x)
{
  if (x < 0 || (x % 10 == 0 && x != 0)) { return false; }

  int reverse = 0;
  while (reverse < x) {
    reverse = reverse * 10 + x % 10;
    x = x / 10;
  }
  return reverse == x || reverse / 10 == x;
}


int main()
{
  int x = 0;
  while (cin >> x) { cout << (isPalindrome(x) ? "is Palindrome" : "not Palindrome") << endl; }
}
