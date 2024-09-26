#ifndef LINKED_LIST_H
#define LINKED_LIST_H

#include <initializer_list>
#include <iostream>
#include <memory>

namespace base {

template<typename T> class ListNode
{
public:
  T val;
  std::unique_ptr<ListNode<T>> next;
  ListNode(T value) : val(value), next(nullptr) {}
  // this will copy this node and successors nodes.
  ListNode(const ListNode<T> &other) : val(other.val), next(nullptr)
  {
    if (other.next) { next = std::make_unique<ListNode<T>>(*other.next); }
    std::cout << "Copy constructing node with value: " << val << "\n";
  }

  ListNode &operator=(const ListNode<T> &other)
  {
    if (this != &other) {
      val = other.val;
      next = other.next ? std::make_unique<ListNode<T>>(*other.next) : nullptr;
    }
    std::cout << "Copy assigning node with value: " << val << "\n";
    return *this;
  }

  ListNode(ListNode<T> &&other) noexcept : val(other.val), next(std::move(other.next)) {}
  ListNode &operator=(ListNode<T> &&other) noexcept
  {
    if (this != &other) {
      val = other.val;
      next = std::move(other.next);
    }
    return *this;
  }

  ~ListNode() { std::cout << "Destroying node with value: " << val << "\n"; }
};

template<typename T> class LinkedList
{
private:
  std::unique_ptr<ListNode<T>> head;

public:
  LinkedList() : head(nullptr) {}

  // 从列表字面量初始化
  LinkedList(std::initializer_list<T> init) : head(nullptr)
  {
    for (const T &value : init) { append(value); }
  }

  LinkedList(ListNode<T> *_head)
  {
    head = std::make_unique<ListNode<T>>(*_head);
    // while (_head) {
    //   append(_head->val);
    //   _head = _head->next.get();
    // }
  }

  LinkedList(std::unique_ptr<ListNode<T>> _head) : head(std::move(_head)) {}

  LinkedList(const LinkedList<T> &other) : head(nullptr)
  {
    if (other.head) { head = std::make_unique<ListNode<T>>(*other.head); }
  }

  LinkedList &operator=(const LinkedList<T> &other)
  {
    if (this != &other) { head = other.head ? std::make_unique<ListNode<T>>(*other.head) : nullptr; }
    return *this;
  }

  // 析构函数
  ~LinkedList()
  {
    while (head) {
      std::unique_ptr<ListNode<T>> temp = std::move(head);
      head = std::move(temp->next);
    }
  }

  // 在链表末尾添加节点
  void append(T value)
  {
    std::unique_ptr<ListNode<T>> newNode = std::make_unique<ListNode<T>>(value);
    if (!head) {
      head = std::move(newNode);
      return;
    }
    ListNode<T> *current = head.get();
    while (current->next) { current = current->next.get(); }
    current->next = std::move(newNode);
  }

  // 打印链表信息
  void print() const
  {
    ListNode<T> *current = head.get();
    std::cout << "链表内容: ";
    while (current) {
      std::cout << current->val;
      if (current->next) { std::cout << " -> "; }
      current = current->next.get();
    }
    std::cout << std::endl;
  }
  // 获取头节点指针
  ListNode<T> *getHead() const { return head.get(); }

  void reverse()
  { 
    // the code below will copy all the nodes, which is not what we want.
    // auto dummyPtr = std::make_unique<ListNode<T>>(*head);
    std::unique_ptr<ListNode<T>> tmp1 = std::move(head);
    std::unique_ptr<ListNode<T>> tmp2 = std::move(tmp1.get()->next);
    ListNode<T> *iter = tmp2.get();
    while (iter) {
      std::swap(iter->next, tmp1);
      std::swap(tmp1, tmp2);
      iter = tmp2.get();
    }
    head = std::move(tmp1);
  }

  bool operator==(const LinkedList<T> &other) const
  {
    ListNode<T> *current1 = head.get();
    ListNode<T> *current2 = other.head.get();
    while (current1 && current2) {
      if (current1->val != current2->val) { return false; }
      current1 = current1->next.get();
      current2 = current2->next.get();
    }
    return current1 == nullptr && current2 == nullptr;
  }
};
}// namespace base

#endif// LINKED_LIST_H