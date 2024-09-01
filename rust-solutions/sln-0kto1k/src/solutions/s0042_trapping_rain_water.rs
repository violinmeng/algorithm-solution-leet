
pub fn trap(height: Vec<i32>) -> i32 {
    let mut res = 0;
    let mut left = 0;
    let mut right = height.len() - 1;
    let mut left_max = 0;
    let mut right_max = 0;
    while left < right {
        if height[left] < height[right] {
            if height[left] >= left_max {
                left_max = height[left];
            } else {
                res += left_max - height[left];
            }
            left += 1;
        } else {
            if height[right] >= right_max {
                right_max = height[right];
            } else {
                res += right_max - height[right];
            }
            right -= 1;
        }
    }
    res
}
// Dynamic Programming
pub fn trap_dp(height: Vec<i32>) -> i32 {
    let len = height.len();
    if len == 0 {
        return 0;
    }

    let left_max = height.iter().fold(Vec::new(), |mut a: Vec<i32> , b| {
        if let Some(x) = a.last() {
            a.push(*x.max(b));
        } else {
            a.push(*b);
        }
        a
    });

    let mut right_max = height.iter().rfold(Vec::new(), |mut acc: Vec<i32>,  b | {
        if let Some(x) = acc.last() {
            acc.push(*x.max(b));
        } else {
            acc.push(*b);
        }
        (move|| acc)()
    });
    right_max.reverse();

    let min_left_right = left_max.iter().zip(right_max.iter()).map(|(x, y)| x.min(y));
    let ans = min_left_right.zip(height.iter()).map(|(x, y)| x - y).sum();
    return ans;
}

// Monotone Stack
pub fn trap_stack(height: Vec<i32>) -> i32 {
    let mut stack = Vec::new();
    let mut ans = 0;
    for i in 0..height.len() {
        while !stack.is_empty() && height[i] > height[*stack.last().unwrap()] {
            let top = stack.pop().unwrap();
            if stack.is_empty() {
                break;
            }
            let distance = (i - stack.last().unwrap() - 1) as i32;
            let bounded_height = height[*stack.last().unwrap()].min(height[i]) - height[top];
            ans += distance * bounded_height;
        }
        stack.push(i);
    }
    ans
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_trap() {
        assert_eq!(trap(vec![0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), 6);
        assert_eq!(trap(vec![4, 2, 0, 3, 2, 5]), 9);
        assert_eq!(trap(vec![4, 2, 3]), 1);
    }
    #[test]
    fn test_trap_dp() {
        assert_eq!(trap_dp(vec![0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), 6);
    }
    #[test]
    fn test_trap_stack() {
        assert_eq!(trap_stack(vec![0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), 6);
    }
}