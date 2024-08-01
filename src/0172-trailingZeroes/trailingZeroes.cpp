#include <iostream>

using namespace std;
// n！结果中0的个数
//本质就是寻找从1到n中5的因子，

//求出每个阶乘因子中5的因子。
int trailingZeroes(int n) {
    
    int zeroCount = 0;
    for (int i = 5; i <= n; i += 5) {
        int powerOf5 = 5;
        while (i % powerOf5 == 0) {
            zeroCount += 1;
            powerOf5 *= 5;
        }
    }
    return zeroCount;
}

//从n整体的分析；
int trailingZeroes(int n) {

    int zeronum = 0;

    while (n > 0) {
        n /= 5;
        zeronum += n;
    }

    return zeronum;

}

int main () {



}