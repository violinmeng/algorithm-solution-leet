#include <iostream>
#include <string>
using namespace std;



string countAndSay(int n) {

    if (n == 1) return "1";
        
    string s = "1";
    for (int i = 2; i <= n; i++)
    {
        s = countAndSayStr(s);
    }

    return s;

}

string countAndSayStr(string s) {
    string ans;

    int couter = 1;

    int length = s.length();

    for (int i = 1; i< length ; i++)
    {
        if (s[i] == s[i-1]) {
            couter++;
        } else {
            ans = ans + to_string(couter) + s[i-1];
            couter = 1;
        }
    }

    ans = ans + to_string(couter) + s[length-1];


    return ans;


}


int main()
{
    cout << countAndSay(20) << endl;
    return 0;
}