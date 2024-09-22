#include <iostream>
#include <stack>
#include <vector>
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


vector<int> postorderTraversal(TreeNode *root)
{
  vector<int> vec;
  postorderTraversal(root, vec);
  return vec;
}

void postorderTraversal(TreeNode *root, vector<int> &vec)
{
  if (!root) return;
  postorderTraversal(root->left, vec);
  postorderTraversal(root->right, vec);
  vec.push_back(root->val);
}

vector<int> postorderTraversal_Iterator(TreeNode *root)
{
  stack<TreeNode *> stk;
  vector<int> vec;
  if (!root) { return vec; }

  TreeNode *pre = nullptr;

  while (root != nullptr || !stk.empty()) {
    while (root) {
      stk.push(root);
      root = root->left;
    }
    root = stk.top();
    stk.pop();
    if (root->left == nullptr || root->right == pre) {
      vec.push_back(root->val);
      pre = root;
      root == nullptr;
    } else {
      stk.push(root);
      root = root->right;
    }
  }
  return vec;
}


void addPath(vector<int> &vec, TreeNode *node)
{
  int count = 0;
  while (node != nullptr) {
    ++count;
    vec.emplace_back(node->val);
    node = node->right;
  }
  reverse(vec.end() - count, vec.end());
}
vector<int> postorderTraversal_Morris(TreeNode *root)
{
  vector<int> vec;

  TreeNode *node = root;
  while (node) {
    if (node->left) {
      TreeNode *predecessor = node->left;
      while (predecessor->right && (predecessor->right != node)) { predecessor = predecessor->right; }

      if (!predecessor->right) {
        predecessor->right = node;
        node = node->left;
        continue;
      } else {
        predecessor->right = nullptr;
        addPath(vec, node->left);
        node = node->right;
      }
    } else {
      node = node->right;
    }
  }
  addPath(vec, node->left);
  return vec;
}

int main()
{
  TreeNode *root = new TreeNode(1);
  TreeNode *node1 = new TreeNode(2);
  TreeNode *node2 = new TreeNode(3);
  root->right = node1;
  node1->left = node2;
  vector<int> ans = postorderTraversal(root);

  for_each(ans.begin(), ans.end(), [](const int i) { cout << i << " "; });
  cout << endl;

  return 0;
}