use std::time::Instant;

pub fn can_partition_k_subsets(nums: Vec<i32>, k: i32) -> bool {
    let sum = nums.iter().sum::<i32>();
    if sum % k != 0 {
        return false;
    }
    let target = sum / k;
    let mut nums = nums.to_vec();
    nums.sort();
    if *nums.last().unwrap() > target {
        return false;
    }

    let n = nums.len();
    let mut dp = vec![true; 1<<n];

    fn dfs(s: i32, p: i32, target: i32, dp: &mut Vec<bool>, nums: &[i32]) -> bool {
        if s == 0 {
            return true
        }
        if !dp[s as usize] {
            return false;
        }
        dp[s as usize] = false;
        for i in 0..nums.len() {
            if nums[i] + p > target {
                break;
            }
            if s & (1 << i) == 0 {
                continue;
            }
            if dfs(s ^ (1 << i), (p + nums[i]) % target, target, dp, nums) {
                return true;
            }
        }
        return false;
    }

    return dfs((1 << n) - 1, 0, target, &mut dp, &nums);
}

pub fn can_partition_k_subsets_v2(mut nums: Vec<i32>, k: i32) -> bool {
    fn back_trace(nums: &mut Vec<i32>, buckets: &mut Vec<i32>, start: i32, target: i32) -> bool {
        if start < 0 { return true; }
        let num = nums[start as usize];
        for i in 0..buckets.len() {
            if num + buckets[i] <= target {
                buckets[i] += num;
                if back_trace(nums, buckets, start - 1, target) { return true; }
                buckets[i] -= num;
            }
            if buckets[i] == 0 { break; }
        }
        false
    }
    let (sum, n) = (nums.iter().sum::<i32>(), nums.len() as i32);
    nums.sort();
    if sum % k != 0 || sum / k < nums[0] || sum / k < nums[n as usize - 1] { return false; }
    back_trace(&mut nums, &mut vec![0; k as usize], n - 1, sum / k)
}

pub fn can_partition_k_subsets_no_cache(nums: Vec<i32>, k: i32) -> bool {

    let sum = nums.iter().sum::<i32>();
    if sum % k != 0 {
        return false;
    }

    let target = sum / k;
    let mut used = vec![false; nums.len()];
    let mut groups = vec![0; k as usize];
    let mut res = false;
    dfs_no_cache(&nums, &mut used, &mut groups, 0, target, &mut res);
    res
}

fn dfs_no_cache(nums: &[i32], used: &mut Vec<bool>, groups: &mut Vec<i32>, idx: usize, target: i32, res: &mut bool) {
    if idx == nums.len() {
        *res = true;
        return;
    }
    if *res {
        return;
    }
    for i in 0..groups.len() {
        if groups[i] + nums[idx] > target {
            continue;
        }
        if used[idx] {
            continue;
        }
        groups[i] += nums[idx];
        used[idx] = true;
        dfs_no_cache(nums, used, groups, idx + 1, target, res);
        used[idx] = false;
        groups[i] -= nums[idx];
    }
}

#[allow(dead_code)]
fn benchmarks() {
    let start = Instant::now();
    for _i in 0..10000 {
        can_partition_k_subsets(vec![1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5], 5);
    }
    println!("cost: {:#?}", start.elapsed());

    let start = Instant::now();
    for _i in 0..10000 {
        can_partition_k_subsets_v2(vec![1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5], 5);
    }
    println!("cost: {:#?}", start.elapsed());
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_can_partition_k_subsets() {
        assert_eq!(can_partition_k_subsets(vec![4, 3, 2, 3, 5, 2, 1], 4), true);
        assert_eq!(can_partition_k_subsets(vec![1, 2, 3, 4], 3), false);
        assert_eq!(can_partition_k_subsets(vec![1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5], 5), true);

        assert_eq!(can_partition_k_subsets_no_cache(vec![4, 3, 2, 3, 5, 2, 1], 4), true);
        assert_eq!(can_partition_k_subsets_no_cache(vec![1, 2, 3, 4], 3), false);
        assert_eq!(can_partition_k_subsets_no_cache(vec![1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5], 5), true);

        assert_eq!(can_partition_k_subsets_v2(vec![4, 3, 2, 3, 5, 2, 1], 4), true);
        assert_eq!(can_partition_k_subsets_v2(vec![1, 2, 3, 4], 3), false);
        assert_eq!(can_partition_k_subsets_v2(vec![1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5], 5), true);
    }
} 