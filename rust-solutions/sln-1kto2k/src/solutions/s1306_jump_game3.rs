use std::collections::VecDeque;

pub fn can_reach(arr: Vec<i32>, start: i32) -> bool {
    fn can_reach_index(arr: &mut Vec<i32>, idx: i32, start:i32) -> bool {
        if idx == start {
            return true;
        }
        let mut ret = false;
        let mut idxs = vec![];
        for (i, x) in arr.iter_mut().enumerate() {
            let i = i as i32;
            if i == idx {
                continue;
            }
            if i+*x == idx || i-*x == idx {
                if i == start {
                    return true;
                } else {
                    *x = 0;
                    idxs.push(i);
                }
            }
        }
        if idxs.is_empty() {
            return false;
        }
        // because of the limitations of rust.
        // if we can not borrow the mut variable twice.
        // then we can borrow it one after another.
        for idx in idxs {
            ret |= can_reach_index(arr, idx, start);
        }
        ret
    }

    // find zero index
    let mut ans = false;
    for (i, x) in arr.iter().enumerate() {
        if *x ==  0 {
            let mut arr = arr.to_vec();
            ans |= can_reach_index(&mut arr, i as i32, start);
        }
    }
    ans
}

// because the given vec's elements are all greater than zero.
// so we can use negative value to mark the visited index.
pub fn can_reach_v2(arr: Vec<i32>, start: i32) -> bool {
    if arr[start as usize] == 0 {
        return true;
    }
    let mut queue = VecDeque::new();
    let mut arr = arr.to_vec();
    arr[start as usize] = -arr[start as usize];
    queue.push_back(start);
    while let Some(idx) = queue.pop_front() {
        let x = arr[idx as usize];
        if x == 0 {
            return true;
        }
        let right = idx-x;
        if  right < arr.len() as i32 && arr[right as usize] >= 0 {
            queue.push_back(right);
            arr[right as usize] = -arr[right as usize];
        }
        let left = idx+x;
        if left >= 0 && arr[left as usize] >= 0 {
            queue.push_back(left);
            arr[left as usize] = -arr[left as usize];
        }
    }
    false
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_can_reach() {
        assert_eq!(can_reach(vec![3,0,2,1,2], 2), false);
        assert_eq!(can_reach(vec![1,1,1,1,1,1,1,1,0], 3), true);
        assert_eq!(can_reach(vec![0], 0), true);
        assert_eq!(can_reach(vec![4,2,3,0,3,1,2], 5), true);

        assert_eq!(can_reach_v2(vec![3,0,2,1,2], 2), false);
        assert_eq!(can_reach_v2(vec![1,1,1,1,1,1,1,1,0], 3), true);
        assert_eq!(can_reach_v2(vec![0], 0), true);
        assert_eq!(can_reach_v2(vec![4,2,3,0,3,1,2], 5), true);
    }
}