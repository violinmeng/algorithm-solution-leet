
pub fn max_strength(nums: Vec<i32>) -> i64 {
    if nums.len() == 1 {
        return *nums.first().unwrap() as i64;
    }

    // find the element which is negative and whose abs is minimum.
    let pos = nums.iter().enumerate().fold((nums.len(), -10), |(idx, max_neg), (i, &x)|{
        if x < 0 && x > max_neg {
            (i, x)
        } else {
            (idx, max_neg)
        }
    });

    // filter out the zero and the previous founded element.
    let filter = nums.iter().enumerate().filter(|(i, x)| {
        **x != 0 &&
         *i != pos.0
    }).map(|x| {
        x.1
    }).collect::<Vec<&i32>>();

    if filter.is_empty() {
        0
    } else {
        let res = filter.iter().fold(1 as i64, |acc, x| acc * **x as i64);
        if res < 0 {
            res * pos.1 as i64
        } else {
            res
        }
    }
}

pub fn max_strength_dp(nums: Vec<i32>) -> i64 {
    let (mut mx, mut mn) = (nums[0] as i64, nums[0] as i64);
    nums.iter().skip(1).for_each(|x| {
        let temp_mx = mx;
        let x = *x as i64;
        mx = mx.max(x.max((mx*x).max(mn*x)));
        mn = mn.min(x.min((mn*x).min(temp_mx*x)));
    });
    mx
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_max_strength() {
        assert_eq!(max_strength(vec![3,-1,-5,2,5,-9]), 1350);
        assert_eq!(max_strength(vec![0,-1]), 0);
        assert_eq!(max_strength(vec![0,1,-1]), 1);
        assert_eq!(max_strength(vec![-9]), -9);

        assert_eq!(max_strength_dp(vec![3,-1,-5,2,5,-9]), 1350);
        assert_eq!(max_strength_dp(vec![0,-1]), 0);
        assert_eq!(max_strength_dp(vec![0,1,-1]), 1);
        assert_eq!(max_strength_dp(vec![-9]), -9);
    }
}