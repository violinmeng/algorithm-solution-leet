#include <iostream>
#include <algorithm>
#include <queue>

using namespace std;

typedef struct TreeNode
{
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
} TreeNode;

int maxDepth(TreeNode* root) {
    if (!root) return 0;
    int ans = max(maxDepth(root->left), maxDepth(root->right)) + 1;
    return ans;
}

int maxDepth(TreeNode* root) {
    if (root == nullptr) return 0;
    queue<TreeNode*> Q;
    Q.push(root);
    int ans = 0;
    while (!Q.empty()) {
        int sz = Q.size();
        while (sz > 0) {
            TreeNode* node = Q.front();Q.pop();
            if (node->left) Q.push(node->left);
            if (node->right) Q.push(node->right);
            sz -= 1;
        }
        ans += 1;
    } 
    return ans;
}

int main ()
{
    TreeNode *root = new TreeNode(3);
    root->left = new TreeNode(9);
    root->right = new TreeNode(20);
    root->right->left = new TreeNode(15);
    root->right->right = new TreeNode(7);

    cout << maxDepth(root) << endl;
    return 0;
}