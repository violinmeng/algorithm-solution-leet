#include <math.h>
#include <iostream>

using namespace std;

// fibonacci 
int climbStairs(int n) {
    int p = 0, q = 0, r = 1;
    for (int i = 1; i <= n; i++)
    {
        p = q;
        q = r;
        r = p + q;
    }
    return r;
}

int climbStairs(int n) {
    double sqrt5 = sqrt(5);
    double fibn = pow((1 + sqrt5) / 2, n + 1) - pow((1 - sqrt5) / 2, n + 1);
    return (int)(fibn / sqrt5);
}

int main()
{
    cout << climbStairs(0) << endl;
    cout << climbStairs(10) << endl;
    return 0;
}