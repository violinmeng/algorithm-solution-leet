#include <iostream>
#include <queue>

using namespace std;

typedef struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(nullptr), right(nullptr){};
} TreeNode;

int minDepth(TreeNode *root) {
    if (!root)
    {
        return 0;
    }

    TreeNode *flag = new TreeNode(0);

    queue<TreeNode *> que;
    que.push(root);
    que.push(flag);
    int ans = 0;
    while (que.size() != 1)
    {
        TreeNode *node = que.front();
        que.pop();
        if (node == flag)
        {
            ans++;
            que.push(flag);

        } else {

            if (!node->left && !node->right) {
                return ans+1;
            }

            if (node->left) {
            que.push(node->left);

            }
            if(node->right) {
            que.push(node->right);

            }
        }
    }

    return ans+1;
}

int minDepth(TreeNode* root) {
    if (root == nullptr) {
        return 0;
    }

    if (root->left == nullptr && root->right == nullptr) {
        return 1;
    }

    int min_depth = INT_MAX;
    if (root->left != nullptr) {
        min_depth = min(minDepth(root->left), min_depth);
    }
    if (root->right != nullptr) {
        min_depth = min(minDepth(root->right), min_depth);
    }

    return min_depth + 1;
}


int main () {
    TreeNode *root  = new TreeNode(3);
    TreeNode *node1 = new TreeNode(9);
    TreeNode *root  = new TreeNode(20);
    TreeNode *root  = new TreeNode(15);
    TreeNode *root  = new TreeNode(3);



    return 0;
}
