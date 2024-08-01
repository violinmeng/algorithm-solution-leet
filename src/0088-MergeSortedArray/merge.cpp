
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {
    int ins = m + n -1;
    m--;
    n--;
    for (int i = ins; i >= 0; i--) {
        if (m < 0) {
            for (int j = n; j >= 0; j--) {
                nums1[j] = nums2[j];
            }
            break;
        }
        
        if (n < 0) break;

        if(nums1[m] >= nums2[n]) {
            nums1[i] = nums1[m];
            m--;
        } else {
            nums1[i] = nums2[n];
            n--;
        }
    }
}

int main()
{
    vector<int> v1 = {1,2,3,0,0,0};
    vector<int> v2 = {2,5,6};
    merge(v1,3,v2,3);

    for_each(v1.begin(), v1.end(), [](const int i) {
        cout << i << " ";
    });
    cout << endl;

    return 0;
}