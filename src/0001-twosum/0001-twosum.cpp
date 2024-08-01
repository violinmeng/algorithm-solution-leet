#include <iostream>
#include <vector>
#include <unordered_map>

//clang++ -std=c++11 -stdlib=libc++ -Weverything 0001-twosum.cpp
/*
 * Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Output: Because nums[0] + nums[1] == 9, we return [0, 1].

*/

/**
 * given a array with a bunch of numbers and a target numbers
 * find the indexs of the two numbers which num
 */

using namespace std;

vector<int> twoSum(vector<int> & nums, int target)
{
    size_t size = nums.size();

    unordered_map<int, int> map;

    for (int i = 0; i < size; i++)
    {
        auto iterator = map.find(target - nums[i]);
        if (iterator != map.end()) 
        {
            return {iterator->second, i};

        }
        map[nums[i]] = i;
    }

    return {};

}

void printVector(vector<int> &vec)
{
    for (auto &&i : vec)
    {
        cout << i << ' ';
    }
    cout << endl;
}

int main ()
{
    vector<int> inp = {2,7,11,15};
    int target = 9;
    vector<int> res = twoSum(inp, target);
//    cout << res[0] << " " << res[1] <<endl;
    printVector(res);
    return 0;
}
