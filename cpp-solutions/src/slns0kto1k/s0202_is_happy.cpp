#include <iostream>
#include <unordered_set>

using namespace std;

bool isHappy(int n)
{
  unordered_set<int> nset;
  while (n != 1) {
    nset.insert(n);
    n = getNext(n);
    if (nset.count(n) == 1) { return false; }
  }
  return true;
}

int getNext(int n)
{
  int sum = 0;
  while (n > 0) {
    int mod = n % 10;
    sum += (mod * mod);
    n /= 10;
  }
  return sum;
}

// link exist circle;
bool isHappy_linkcircle(int n)
{
  int slowRunner = n;
  int fastRunner = getNext(n);
  while (fastRunner != 1 && slowRunner != fastRunner) {
    slowRunner = getNext(slowRunner);
    fastRunner = getNext(getNext(fastRunner));
  }
  return fastRunner == 1;
}

// in fact there is only one circle
// that is 4, 16, 37, 58, 89, 145, 42, 20


bool isHappy(int n)
{
  unordered_set<int> cycleMembers = { 4, 16, 37, 58, 89, 145, 42, 20 };
  while (n != 1 && cycleMembers.count(n) == 0) { n = getNext(n); }
  return n == 1;
}

int main()
{
  cout << (isHappy(19) ? "is Happy" : "is not happy") << endl;
  return 0;
}