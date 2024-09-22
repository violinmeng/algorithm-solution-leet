#include <iostream>
#include <string>
using namespace std;

int romanToInt(string s)
{
  if (s.size() < 1) return 0;
  int pre = valueForChar(s[0]);
  int size = s.size();
  int sum = 0;
  for (int i = 1; i < size; i++) {
    int cur = valueForChar(s[i]);
    if (pre < cur) {
      sum -= pre;
    } else {
      sum += pre;
    }
    pre = cur;
  }
  sum += pre;
  return sum;
}


int valueForChar(char c)
{
  switch (c) {
  case 'I':
    return 1;
  case 'V':
    return 5;
  case 'X':
    return 10;
  case 'L':
    return 50;
  case 'C':
    return 100;
  case 'D':
    return 500;
  case 'M':
    return 1000;
  default:
    break;
  }
  return 0;
}

int main()
{
  cout << romanToInt("III") << endl;
  cout << romanToInt("IVX") << endl;
  cout << romanToInt("MCMXCIV") << endl;
  return 0;
}