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


vector<int> preorderTraversal(TreeNode *root)
{
  vector<int> vec;
  preorderTraversal(root, vec);
  return vec;
}

void preorderTraversal(TreeNode *root, vector<int> &vec)
{
  if (!root) return;
  vec.push_back(root->val);
  preorderTraversal(root->left, vec);
  preorderTraversal(root->right, vec);
}

vector<int> preorderTraversal_Iterator(TreeNode *root)
{
  stack<TreeNode *> stk;
  vector<int> vec;
  if (!root) { return vec; }

  stk.push(root);

  while (!stk.empty()) {
    TreeNode *node = stk.top();
    vec.push_back(node->val);
    stk.pop();

    if (node->right) { stk.push(node->right); }

    if (node->left) { stk.push(node->left); }
  }
  return vec;
}

vector<int> preorderTraversal_Morris(TreeNode *root)
{
  vector<int> vec;

  TreeNode *node = root;
  while (node) {
    if (!node->left) {
      vec.push_back(node->val);
      node = node->right;
    } else {
      TreeNode *predecessor = node->left;
      while (predecessor->right && (predecessor->right != node)) { predecessor = predecessor->right; }

      if (!predecessor->right) {
        vec.push_back(node->val);
        predecessor->right = node;
        node = node->left;
      } else {
        predecessor->right = nullptr;
        node = node->right;
      }
    }
  }
  return vec;
}

int main()
{
  TreeNode *root = new TreeNode(1);
  TreeNode *node1 = new TreeNode(2);
  TreeNode *node2 = new TreeNode(3);
  root->right = node1;
  node1->left = node2;
  vector<int> ans = preorderTraversal(root);

  for_each(ans.begin(), ans.end(), [](const int i) { cout << i << " "; });
  cout << endl;

  return 0;
}