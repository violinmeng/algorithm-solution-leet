#include <iostream>
#include <vector>


using namespace std;


int maxarea(vector<int> & height)
{
    int le = 0, ri = height.size()-1, ans = 0;

    while (le < ri)
    {
        int area = (ri - le) * min(height[le], height[ri]);
        ans = max(ans, area);
        if (height[le] < height[ri])
        {
            int x = height[le];
            le++;
            while (height[le] < x && ri > le)
            {
                le++;
            }
            
        } 
        else
        {
            int x = height[ri];
            ri--;
            while (height[ri] < x && ri > le)
            {
                ri--;
            }
            
        }

    }
    return ans;
    

}


int main() 
{
    vector<int> inp = {1,8,6,2,5,4,8,3,7};
    cout << maxarea(inp) << endl;
}
