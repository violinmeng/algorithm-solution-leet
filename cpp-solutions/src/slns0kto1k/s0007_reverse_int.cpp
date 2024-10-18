#include "slns0kto1k.h"
#include <climits>
int reverse(int x)
{
  int res = 0;
  const int ten = 10;
  while (x != 0) {
    if (res > INT_MAX / ten) { return 0; }
    if (res < INT_MIN / ten) { return 0; }
    res = res * ten + (x % ten);
    x = x / ten;
  }
  return res;
}