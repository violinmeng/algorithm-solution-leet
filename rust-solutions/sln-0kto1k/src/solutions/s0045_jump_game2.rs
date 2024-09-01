#[macro_export]
macro_rules! either {
    ($test:expr => $true_expr:expr; $false_expr:expr) => {
        if $test {
            $true_expr
        }
        else {
            $false_expr
        }
    }
}

pub fn jump(nums: Vec<i32>) -> i32 {
    let mut nums = nums.to_vec();
    nums.pop();
    nums.iter().enumerate().fold((0, 0, 0), |(max_position,end,steps), (i, x)| {
        let max_position = max_position.max(i as i32 + x);
        (max_position, either!(i == end => max_position as usize ; end), either!(i == end => steps+1 ; steps))
        // (max_position, if i == end { max_position as usize } else { end }, if i == end { steps+1 } else { steps })
    }).2
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_jump() {
        assert_eq!(jump(vec![2,3,1,1,4]), 2);
        assert_eq!(jump(vec![2,3,0,1,4]), 2);
        assert_eq!(jump(vec![1,1,1,1,1]), 4);
    }
}
