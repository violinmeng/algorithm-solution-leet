#include <iostream>
#include <string>
#include <vector>

using namespace std;


string convert(string s, int numRows) {
    if (s.length() <= numRows || numRows <= 1) return s;

    vector<string> vec(numRows, "");
    
    bool dec = false;
    int i = 0;
    for (auto &&ca : s)
    {
        vec[i] += ca;
        i = dec ? i-1 : i+1;
        // here numrows == 1;  i = 1, and access vec[1] will got exception;

        if (i == numRows -1 || i == 0)
            dec = !dec;
    }

    string ans;
    for (auto &&str : vec)
        ans += str; 
    
    return ans;
}


int main ()
{
    string s = "PAYPALISHIRING";
    cout << convert(s,3) << endl;
    cout << convert(s,1) << endl;
    cout << convert(s,0) << endl;
}