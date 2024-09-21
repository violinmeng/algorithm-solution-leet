#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int removeElement(vector<int>& nums, int val) {

    int i = 0;
    int size = nums.size();

    for (int j = 0; j < size; j++)
    {   
        if (nums[j] != val)
        {
            nums[i] = nums[j];
            i++;
        }
        
    }
    
    return i;
    
}

int removeElement1(vector<int>& nums, int val) {

    int i = 0;
    int size = nums.size();

    int n = size;

    while (i < n)
    {
        if (nums[i] == val)
        {
            nums[i] = nums[n-1];
            n--;
        } else {
            i++;
        }
        
    }
    
    return i;
    
}

int main ()
{
    vector<int> vec = {3,2,2,3};
    int ans = removeElement(vec,3);
    cout << ans << endl;

    for_each(vec.begin(), vec.begin()+ans, [](const int i){cout << i << " ";});
    cout << endl;
    return 0;
}