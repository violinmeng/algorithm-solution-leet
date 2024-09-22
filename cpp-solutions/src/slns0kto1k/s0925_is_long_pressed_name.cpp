#include <iostream>
#include <string>

using namespace std;

bool isLongPressedName(string name, string typed)
{
  if (name.size() == 0) return typed.size() == 0;

  int i = 0, j = 0;

  while (i < name.size() && j < typed.size()) {
    if (name[i] == typed[j]) {
      i++;
      j++;
    } else {
      if (j > 0) {
        if (typed[j] == typed[j - 1]) {
          j++;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
  }

  while (j < typed.size()) {
    if (typed[j] == typed[j - 1]) {
      j++;
    } else {
      return false;
    }
  }

  return i == name.size() - 1;
}

int main()
{

  cout << (isLongPressedName("alex", "aaleex") ? "yes" : "no") << endl;

  return 0;
}