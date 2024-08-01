#include <iostream>
#include <vector>

using namespace std;


void reverseString(vector<char>& s) {
    int n = s.size();
    for (int i = 0, j = n-1; i < j; i++, j--) {
        swap(s[i], s[j]);
    }
}


int main()
{
    vector<char> s = {'h','e','l','l','o'};
    reverseString(s);
    for_each(s.begin(), s.end(), [](const char c){ cout << c << " ";});
    cout << endl;

    return 0;
}