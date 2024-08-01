#include <iostream>

using namespace std;

int mySqrt(int x) {

    int lo = 0, hi = x, res = -1;

    while (lo <= hi) {
        int mid = (lo + hi) / 2;
        if ((long long)mid * mid <= x)
        {
            res = mid;
            lo = mid + 1;
        } else {
            hi = mid - 1;
        }
    }
    return res;
}

int sqrt(int x) {
    if (x == 0) return 0;

    int C = x, x0 = x;
    while (true)
    {
        int x1 = 0.5*(x0 + C/x0);
        if (fabs(x0 - x1) < 1e-7) {
            break;
        }
        x0 = x1;
    }

    return int(x0);
}

int main() {
    cout << mySqrt(100) << endl;
    cout << sqrt(1893004) << endl;
    return 0;
}