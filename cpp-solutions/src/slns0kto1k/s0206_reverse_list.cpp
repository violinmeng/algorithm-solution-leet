#include "base/LinkedList.h"
// #include <memory>
#include "slns0kto1k.h"
void iterateReverse(base::LinkedList<int> &list1) { list1.reverse(); }

// base::LinkedList<int> recusiveReverse(const base::LinkedList<int> &list1)
// {// NOLINT
//   if (list1.getHead() == nullptr || list1.getHead()->next == nullptr) { return list1; }
//   const base::LinkedList<int> rev = recusiveReverse(base::LinkedList<int>(list1.getHead()->next.get()));// NOLINT
//   list1.getHead()->next->next = std::make_unique<base::ListNode<int>>(*list1.getHead());
//   list1.getHead()->next = nullptr;
//   return rev;
// }