#include <gtest/gtest.h>
#include <vector>
#include "slns0kto1k.h"
#include "base/ListNode.h"
TEST(SolutionsTest, TwoSum)
{
  const std::vector<int> inp = { 2, 7, 11, 15 };
  const int target = 9;
  const std::vector<int> expected = { 0, 1 };
  std::vector<int> res = twoSum(inp, target);
  EXPECT_EQ(res.size(), 2);
  EXPECT_EQ(res[0], expected[0]);
  EXPECT_EQ(res[1], expected[1]);
}

TEST(SolutionsTest, AddTwoNumbers)
{
  const base::LinkedList<int> list1 = { 2, 4, 3 };
  const base::LinkedList<int> list2 = { 5, 6, 4 };
  const base::LinkedList<int> expected = { 7, 0, 8 };
  const base::LinkedList<int> res = addTwoNumbers(list1, list2);
  EXPECT_EQ(res, expected);
}