#include <iostream>
#include <vector>

using namespace std;

// the input numbers are sorted.
// if we use the hasetable, the solution is less efficient;

vector<int> twoSum(vector<int> &numbers, int target)
{
  int size = numbers.size();
  for (int i = 0; i < size; i++) {
    int low = i + 1, high = size - 1;
    while (low <= high) {
      int mid = (low + high) << 1;
      if (numbers[mid] == target - numbers[i]) {
        return { low + 1, mid + 1 };
      } else if (numbers[mid] < target - numbers[i]) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }
  }

  return { -1, -1 };
}
// double pointer

vector<int> twoSum_doublePointer(vector<int> &numbers, int target)
{
  int low = 0, high = numbers.size() - 1;
  while (low < high) {
    int sum = numbers[low] + numbers[high];
    if (sum == target) {
      return { low + 1, high + 1 };
    } else if (sum < target) {
      ++low;
    } else {
      --high;
    }
  }
  return { -1, -1 };
}


int main() { return 0; }