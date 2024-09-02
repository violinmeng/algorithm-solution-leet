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

pub fn jump_v2(nums: Vec<i32>) -> i32 {
    let mut position = nums.len()-1;
    let mut steps = 0;
    while position > 0 {
        for i in 0..position {
            if i+(nums[i] as usize) >= position {
                position = i;
                steps += 1;
                break;
            }
        }
    }
    steps
}
// more functional style.
pub fn jump_v3(nums: Vec<i32>) -> i32 {
    fn jump_rec(nums: &[i32], position: usize) -> i32 {
        if position == 0 {
            return 0;
        }
        nums.iter().enumerate().find(|(i,x)| {
            i+(**x as usize) >= position
        }).map(|(i,_)| {
            jump_rec(nums, i)
        }).unwrap() + 1
    }
    jump_rec(&nums, nums.len()-1)
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_jump() {
        assert_eq!(jump(vec![2,3,1,1,4]), 2);
        assert_eq!(jump(vec![2,3,0,1,4]), 2);
        assert_eq!(jump(vec![1,1,1,1,1]), 4);

        assert_eq!(jump_v2(vec![2,3,1,1,4]), 2);
        assert_eq!(jump_v2(vec![2,3,0,1,4]), 2);
        assert_eq!(jump_v2(vec![1,1,1,1,1]), 4);

        assert_eq!(jump_v3(vec![2,3,1,1,4]), 2);
        assert_eq!(jump_v3(vec![2,3,0,1,4]), 2);
        assert_eq!(jump_v3(vec![1,1,1,1,1]), 4);
    }
}