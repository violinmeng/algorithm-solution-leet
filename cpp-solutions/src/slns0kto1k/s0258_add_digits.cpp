#include <iostream>

using namespace std;


int addDigits(int num)
{
  if (num < 10) { return num; }

  int totol = 0;
  while (num > 0) {
    totol += (num % 10);
    num /= 10;
  }

  return addDigits(totol);
}

int addDigits_iterator(int num)
{
  while (num >= 10) {
    int next = 0;
    while (num != 0) {
      next = next + num % 10;
      num /= 10;
    }
    num = next;
  }
  return num;
}

int addDigits_fast(int num) { return (num - 1) % 9 + 1; }


int main() { return 0; }