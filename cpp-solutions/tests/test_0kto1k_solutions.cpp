#include <gtest/gtest.h>
#include <vector>
#include "slns0kto1k.h"

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