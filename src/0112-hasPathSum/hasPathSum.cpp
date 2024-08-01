#include <iostream>
#include <queue>
using namespace std;

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

bool hasPathSum(TreeNode* root, int sum) {
    if (!root) return false;

    if (!root->left && !root->right) {
        return root->val == sum;
    }

    return hasPathSum(root->left, sum - root->val) || hasPathSum(root->right, sum - root->val);
    
}

bool hasPathSum_BFS(TreeNode *root, int sum) {
    if (root == nullptr) {
        return false;
    }
    queue<TreeNode *> que_node;
    queue<int> que_val;
    que_node.push(root);
    que_val.push(root->val);
    while (!que_node.empty()) {
        TreeNode *now = que_node.front();
        int temp = que_val.front();
        que_node.pop();
        que_val.pop();
        if (now->left == nullptr && now->right == nullptr) {
            if (temp == sum) return true;
            continue;
        }
        if (now->left != nullptr) {
            que_node.push(now->left);
            que_val.push(now->left->val + temp);
        }
        if (now->right != nullptr) {
            que_node.push(now->right);
            que_val.push(now->right->val + temp);
        }
    }
    return false;
}

int main () {



    return 0;
}