#include <iostream>
#include <vector>

#include "longestPalindrome.h"

using namespace std;

string Solution::longestPalindrome(string s) {
           int length = s.size();
        if (length < 2)
        {
            return s;
        }

        int maxlen = 1;
        int begin = 0;

        vector<vector<int> > dp(length, vector<int>(length));
        for (size_t i = 0; i < length; i++)
        {
            dp[i][i] = true;
        }

        for (size_t L = 2; L < length; L++)
        {
            for (size_t i = 0; i < length; i++)
            {
                int j = L + i - 1;
                if (j >= length)
                {
                    break;
                }

                if (s[i] == s[j])
                {
                    if (j - i < 3)
                    {
                        dp[i][j] = true;
                    } 
                    else 
                    {
                        dp[i][j] = dp[i+1][j-1];
                    }
                }
                
                if (dp[i][j] && j - i + 1 > maxlen)
                {
                    maxlen = j - i + 1;
                    begin = i;
                }
            }
            
        }
        return s.substr(begin, maxlen); 
}

int main(int argc, char const *argv[])
{
    cout << Solution::longestPalindrome("babad") << endl;
    return 0;
}