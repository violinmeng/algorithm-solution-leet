#include <iostream>
#include <queue>

using namespace std;

typedef struct TreeNode
{
  int val;
  TreeNode *left;
  TreeNode *right;
  TreeNode(int x) : val(x), left(nullptr), right(nullptr) {};
} TreeNode;


bool isBalanced(TreeNode *root) { return height(root) != -1; }

// from bottom to top;

int height(TreeNode *node)
{
  if (node == nullptr) return 0;
  int leftHeight, rightHeight;
  if ((leftHeight = height(node->left)) == -1 || (rightHeight = height(node->right)) == -1
      || abs(leftHeight - rightHeight) > 1)
    return -1;
  return max(leftHeight, rightHeight) + 1;
}


// from top to bottom;

bool isBalanced1(TreeNode *root)
{
  if (!root) { return true; }

  return abs(height1(root->left) - height1(root->right)) <= 1 && isBalanced1(root->left) && isBalanced1(root->right);
}

int height1(TreeNode *root)
{
  if (root == nullptr) return 0;
  return max(height1(root->left), height1(root->right)) + 1;
}