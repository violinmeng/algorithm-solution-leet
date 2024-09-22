#include <iostream>
#include <queue>

using namespace std;

struct TreeNode
{
  int val;
  TreeNode *left;
  TreeNode *right;
  TreeNode() : val(0), left(nullptr), right(nullptr) {}
  TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
  TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};

int sumNumbers(TreeNode *root) { return sumNumbers(root, 0); }

int sumNumbers(TreeNode *root, int accu)
{
  if (!root) return accu;

  if (!root->left && !root->right) return accu + root->val;

  int sum = 0;
  accu += root->val;
  if (root->left) { sum += sumNumbers(root->left, 10 * accu); }

  if (root->right) { sum += sumNumbers(root->right, 10 * accu); }

  return sum;
}


int bfs_sumNumbers(TreeNode *root)
{
  if (root == nullptr) { return 0; }
  int sum = 0;
  queue<TreeNode *> nodeQueue;
  queue<int> numQueue;
  nodeQueue.push(root);
  numQueue.push(root->val);
  while (!nodeQueue.empty()) {
    TreeNode *node = nodeQueue.front();
    int num = numQueue.front();
    nodeQueue.pop();
    numQueue.pop();
    TreeNode *left = node->left;
    TreeNode *right = node->right;
    if (left == nullptr && right == nullptr) {
      sum += num;
    } else {
      if (left != nullptr) {
        nodeQueue.push(left);
        numQueue.push(num * 10 + left->val);
      }
      if (right != nullptr) {
        nodeQueue.push(right);
        numQueue.push(num * 10 + right->val);
      }
    }
  }
  return sum;
}

int main() { return 0; }
