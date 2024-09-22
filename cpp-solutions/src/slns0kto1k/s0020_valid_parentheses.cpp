#include <iostream>
#include <stack>

using namespace std;

bool isValid(string s)
{

  int n = s.size();
  if (n % 2 == 1) { return false; }

  stack<char> stk;

  for (auto c : s) {
    if (c == '(' || c == '{' || c == '[') {
      stk.push(c);
    } else if (c == ')') {
      if (stk.empty() || stk.top() != '(') {
        return false;
      } else {
        stk.pop();
      }
    } else if (c == '}') {
      if (stk.empty() || stk.top() != '{') {
        return false;
      } else {
        stk.pop();
      }
    } else if (c == ']') {
      if (stk.empty() || stk.top() != '[') {
        return false;
      } else {
        stk.pop();
      }
    } else {
      return false;
    }
  }

  return stk.empty();
}

int main()
{
  cout << (isValid("()") ? "yes" : "no") << endl;
  cout << (isValid("()[]{}") ? "yes" : "no") << endl;
  cout << (isValid("(]") ? "yes" : "no") << endl;
  cout << (isValid("([)]") ? "yes" : "no") << endl;
  cout << (isValid("{()}") ? "yes" : "no") << endl;
  return 0;
}