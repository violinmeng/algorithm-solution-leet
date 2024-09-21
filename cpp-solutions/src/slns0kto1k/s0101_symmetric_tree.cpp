#include <iostream>
#include <queue>

using namespace std;

typedef struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x) , left(nullptr) , right(nullptr) {};
} TreeNode;

bool check(TreeNode *n1, TreeNode *n2)
{
    if (!n1 && !n2)
    {
        return true;
    } else if (!n1 || !n2)
    {
        return false;
    }

    return n1->val == n2->val && check(n1->left, n2->right) && check(n1->right, n2->left);
}

bool check (TreeNode *n1, TreeNode *n2)
{
    queue<TreeNode *> qu;

    qu.push(n1);
    qu.push(n2);

    while (!qu.empty())
    {   
        TreeNode *r1 = qu.front();
        qu.pop();
        TreeNode *r2 = qu.front();
        qu.pop();

        if (!r1 && !r2)
        {
            continue;
        } else if (!r1 || !r2 || r1->val != r2->val)
        {
            return false;
        }

        qu.push(r1->left);
        qu.push(r2->right);

        qu.push(r1->right);
        qu.push(r2->left);
    }

    return true;
}

bool isSymmetric(TreeNode * root)
{
    if (!root)
    {
        return true;
    }

    return check(root->left, root->right);
}

int main ()
{
    TreeNode *root1 = new TreeNode(1);
    root1->left = new TreeNode(2);
    root1->right = new TreeNode(3);

    cout << "tree 1,2,3 symmetric ?"  << (isSymmetric(root1) ? "yes" : "no") << endl;
    cout << "tree null symmetric ?"  << (isSymmetric(nullptr) ? "yes" : "no") << endl;

    TreeNode *root2 = new TreeNode(1);
    root2->left = new TreeNode(2);
    cout << "tree 1,2 symmetric ?"  << (isSymmetric(root2) ? "yes" : "no") << endl;

    TreeNode *root3 = new TreeNode(3);
    root3->left = new TreeNode(2);
    root3->right = new TreeNode(2);

    cout << "tree 1,2,2 symmetric ?"  << (isSymmetric(root3) ? "yes" : "no") << endl;

    return 0;
}