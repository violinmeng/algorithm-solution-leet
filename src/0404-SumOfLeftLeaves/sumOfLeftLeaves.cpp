#include <iostream>
#include <queue>

typedef struct TreeNode
{
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
} TreeNode;

using namespace std;

bool isLeafNode (TreeNode *node)
{
    return node && !node->left && !node->right;
}

int dfs (TreeNode * node) {
    int ans = 0;
    if (node->left)
    {
        ans += isLeafNode(node->left) ? node->left->val : dfs(node->left);
    }

    if (node->right && ! isLeafNode(node->right))
    {
        ans += dfs(node->right);
    }
    
    return ans;
}

int dfs_sumOfLeftLeaves(TreeNode *root)
{
    return root ? dfs(root) : 0;
}

int sumOfLeftLeaves(TreeNode* root)
{

    if (!root) return 0;

    int sum = 0;

    if (root->left)
    {
        if (root->left->left)
        {
            sum += sumOfLeftLeaves(root->left);
        }
        else 
        {
            if (root->left->right)
            {
                sum += sumOfLeftLeaves(root->left->right);
            }
            else
            {
                sum += root->left->val;
            }
        }
    }

    if (root->right)
    {
        sum += sumOfLeftLeaves(root->right);
    }

    return sum;

}

int queue_sumOfLeftLeaves (TreeNode *root)
{
    if (!root) return 0;

    queue<TreeNode *> queue;
    queue.push(root);
    
    int ans = 0;

    while (!queue.empty())
    {
        TreeNode *node = queue.front();
        queue.pop();

        if (root->left) {
            if (isLeafNode(root->left))
            {
                ans += root->left->val;
            } else {
                queue.push(root->left);
            }
        }

        if (root->right && !isLeafNode(root->right))
        {
            queue.push(root->left);
        }
    }
    return ans;
} 


int main () {
    TreeNode *root = new TreeNode(3);
    root->left = new TreeNode(9);
    root->right = new TreeNode(20);
    root->right->left = new TreeNode(15);
    root->right->right = new TreeNode(7);

    cout << sumOfLeftLeaves(root) << endl;
    
    return 0;
}