#include <iostream>
#include <queue>
#include <vector>

using namespace std;

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

vector<vector<int>> levelOrder(TreeNode* root) {
    vector<vector<int>> ans; 
    if (!root)
    {
        return ans;
    }
    

    queue<TreeNode *> que1;
    que1.push(root);
    TreeNode *tag = new TreeNode(0);
    que1.push(tag);

    while (que1.front() != tag)
    {
        TreeNode *front = que1.front();
        vector<int> vec;

        while (front != tag)
        {
            que1.pop();
            vec.push_back(front->val);
            if (front->left)
            {
                que1.push(front->left);
            }

            if (front->right)
            {
                que1.push(front->right);
            }

            front = que1.front();
        }
        
        ans.insert(ans.begin(), vec);
        que1.pop();
        que1.push(tag);
    }

    //here to reverse normal ans vec is more efficient.
    //reverse(result.begin(),result.end());

    delete tag;
    return ans;
}

vector<vector<int>> dfs_levelOrder(TreeNode* root) {
    vector<vector<int>> ans; 
    if (!root)
    {
        return ans;
    }

    dfs(1,root,ans);

    return ans;
}

void dfs(int depth,TreeNode *root, vector<vector<int>> &res) {
    //假设res是[ [1],[2,3] ]， index是3，就再插入一个空list放到res中
    if(res.size()< depth) {
        vector<int> vec;
        res.insert(res.begin(), vec);
    }
    //将当前节点的值加入到res中，index代表当前层，假设index是3，节点值是99
    //res是[ [1],[2,3] [4] ]，加入后res就变为 [ [1],[2,3] [4,99] ]
    res[depth-1].push_back(root->val);
    //递归的处理左子树，右子树，同时将层数index+1
    if(root->left) {
        dfs(depth+1, root->left, res);
    }
    if(root->right) {
        dfs(depth+1, root->right, res);
    }
}

int main()
{
    TreeNode *root = new TreeNode(3);

    vector<vector<int>> ans = levelOrder(root);

    return 0;
}