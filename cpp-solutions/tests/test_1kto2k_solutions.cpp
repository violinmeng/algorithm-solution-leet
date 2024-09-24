#include "slns1kto2k.h"
#include <gtest/gtest.h>
#include <vector>

TEST(SolutionsTest, VideoStitching)
{
  const std::vector<std::vector<int>> clips = { { 0, 2 }, { 4, 6 }, { 8, 10 }, { 1, 9 }, { 1, 5 }, { 5, 9 } };
  const int time = 10;
  const int expected = 3;
  const int res = videoStitching(clips, time);
  EXPECT_EQ(res, expected);
}

TEST(SolutionsTest, FindInMountainArray)
{
  const std::vector<int> mountainArr = { 1, 2, 3, 4, 5, 3, 1 };
  const int target = 3;
  const int expected = 2;
  const int res = findInMountainArray(target, mountainArr);
  EXPECT_EQ(res, expected);
}

TEST(SolutionsTest, UniqueOccurrences)
{
  const std::vector<int> arr = { 1, 2, 2, 1, 1, 3 };
  const bool expected = true;
  const bool res = uniqueOccurrences(arr);
  EXPECT_EQ(res, expected);
  const std::vector<int> arr1 = { 1, 2 };
  const bool expected1 = false;
  const bool res1 = uniqueOccurrences(arr1);
  EXPECT_EQ(res1, expected1);
}