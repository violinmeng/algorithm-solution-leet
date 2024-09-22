#include <iostream>
#include <vector>

using namespace std;


int findInMountainArray(int target, vector<int> &mountainArr)
{
  int peek = findPeek(mountainArr);
  int idx = binarySearch(mountainArr, target, 0, peek, [](int x) { return x; });
  if (idx != -1) { return idx; }
  return binarySearch(mountainArr, target, peek + 1, mountainArr.size() - 1, [](int x) { return -x; });
}


int binarySearch(vector<int> &mountainArr, int target, int left, int right, int key(int))
{
  target = key(target);
  while (left <= right) {
    int mid = (left + right) >> 1;
    int cur = key(mountainArr[mid]);
    if (cur == target) {
      return mid;
    } else if (cur < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}

int findPeek(vector<int> &mountainArr)
{
  int left = 0, right = mountainArr.size() - 1;
  while (left < right) {
    int mid = (left + right) >> 1;
    if (mountainArr[mid] < mountainArr[mid + 1]) {
      left = mid + 1;
    } else {
      right = mid;
    }
  }
  return left;
}

int main()
{
  vector<int> vec = { 1, 2, 3, 4, 5, 3, 1 };
  cout << findInMountainArray(3, vec) << endl;
  return 0;
}