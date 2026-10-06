#include <gtest/gtest.h>

namespace
{
int add(int left, int right)
{
    return left + right;
}
}

TEST(BasicMath, BasicAddition)
{
    EXPECT_EQ(add(2, 3), 5);
}
