#include <cstddef>
#include <vector>
#include "slns1kto2k.h"
using namespace std;

namespace {
int binarySearch(int target, const vector<int> &mountainArr, size_t left, size_t right, int key(int))
{
  target = key(target);
  while (left <= right) {
    const size_t mid = (left + right) >> 1U;
    const int cur = key(mountainArr[mid]);
    if (cur == target) {
      return static_cast<int>(mid);
    } else if (cur < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}

size_t findPeek(const vector<int> &mountainArr)
{
  size_t left = 0;
  size_t right = mountainArr.size() - 1;
  while (left < right) {
    const size_t mid = (left + right) >> 1U;
    if (mountainArr[mid] < mountainArr[mid + 1]) {
      left = mid + 1;
    } else {
      right = mid;
    }
  }
  return left;
}
}

int findInMountainArray(int target, const vector<int> &mountainArr)
{
  const size_t peek = findPeek(mountainArr);
  const int idx = binarySearch(target, mountainArr, 0, peek, [](int x) { return x; });
  if (idx != -1) { return idx; }
  return binarySearch(target, mountainArr, peek + 1, mountainArr.size() - 1, [](int x) { return -x; });
}