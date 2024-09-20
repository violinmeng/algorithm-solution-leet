#include <gtest/gtest.h>
#include "base/ListNode.h"
#include "../src/slns0kto1k/slns0kto1k.h"

TEST(SolutionsTest, TwoSum) {

    std::vector<int> inp = {2,7,11,15};
    int target = 9;
    std::vector<int> res = twoSum(inp, target);
    EXPECT_EQ(res.size(), 2);
    EXPECT_EQ(res[0], 0);
    EXPECT_EQ(res[1], 1);
}