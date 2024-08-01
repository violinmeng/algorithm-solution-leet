#include <iostream>
#include <vector>
#include <stack>
using namespace std;

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 };

bool helper(TreeNode* root, long long lower, long long higer) {
    if (!root) return true;

    if (root->val <= lower || root->val >= higer)
    {
        return false;
    }
    
    return helper(root->left, lower, root->val) && helper(root->right, root->val, higer);
}

bool inorderTraversal(TreeNode* root) {
    return helper(root, LONG_MIN, LONG_MAX);
}

bool isValidBST(TreeNode* root) {
        
    stack<TreeNode *> stk;
    TreeNode *cur = root;
    long pre = LONG_MIN;
    while (cur || !stk.empty())
    {
        while (cur)
        {
            stk.push(cur);
            cur = cur->left;
        }

        cur = stk.top();
        stk.pop();
        if (cur->val <= pre)
        {
            return false;
        }
        pre = cur->val;
        cur = cur->right;
    }

    return true;
}

int main()
{
    TreeNode *root = new TreeNode(1);
    TreeNode *node1 = new TreeNode(2);
    TreeNode *node2 = new TreeNode(3);
    root->right = node1;
    node1->left = node2;
    // vector<int> ans = inorderTraversal(root);

    // for_each(ans.begin(), ans.end(), [](const int i){ cout << i << " ";});
    // cout << endl;

    return 0;
}