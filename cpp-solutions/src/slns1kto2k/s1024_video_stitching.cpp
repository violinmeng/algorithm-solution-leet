#include <algorithm>
#include <climits>
#include <vector>
using namespace std;

int videoStitching(vector<vector<int>> &clips, int time)
{
  vector<int> vec(time + 1, INT_MAX - 1);

  vec[0] = 0;

  for (int i = 0; i <= time; i++) {
    for (auto &&clip : clips) {
      if (clip[0] < i && i <= clip[1]) { vec[i] = min(vec[i], vec[clip[0]] + 1); }
    }
  }

  return vec[time] == INT_MAX - 1 ? -1 : vec[time];
}