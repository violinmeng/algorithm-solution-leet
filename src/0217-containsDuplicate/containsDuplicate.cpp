#include <iostream>
#include <vector>
#include <unordered_map>
using namespace std;

bool containsDuplicate(vector<int>& nums) {

    unordered_map<int,bool> map;

    for (auto &&i : nums)
    {
        if (map.find(i) != map.end())
        {
            return true;
        } else {
            map[i] = true;
        }
        
    }
    return false;
}

int main() 
{
    return 0;
}