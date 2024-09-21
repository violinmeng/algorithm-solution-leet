#include <iostream>

using namespace std;

int lengthOfLastWord(string s) {
    int n = s.length()-1;
    int i = 0;
    while (n >= 0)
    {
        if (s[n] != ' ')
        {
            i++;
        } else if (i != 0)
        {
            break;
        }
        n--;
    }
    return i;
}

int main () {
    cout << lengthOfLastWord("hello world") << endl;
    return 0;
}