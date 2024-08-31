
pub fn result_array(nums: Vec<i32>) -> Vec<i32> {
    if nums.len() < 3 {
        return nums;
    }
    let mut arr1: Vec<i32> = Vec::new();
    let mut arr2: Vec<i32> = Vec::new();
    arr1.push(nums[0]);
    arr2.push(nums[1]);

    for num in &nums[2..] {
        if arr1.last() > arr2.last() {
            arr1.push(*num);
        } else {
            arr2.push(*num);
        }
    }

    arr1.append(&mut arr2);
    return arr1;
}

// Testing in place.
#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_result_array() {
        let nums = vec![2,1,3];
        let result = result_array(nums);
        assert_eq!(result, vec![2,3,1]);
    }
}