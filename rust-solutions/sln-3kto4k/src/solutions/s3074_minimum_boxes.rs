use std::convert::TryInto;

pub fn minimum_boxes(apple: &Vec<i32>, capacity: &Vec<i32>) -> i32 {
    let mut capacity = capacity.to_vec();
    capacity.sort_by(|a, b| b.cmp(a));
    let mut sum = apple.iter().sum::<i32>();
    if sum > capacity.iter().sum::<i32>() {
        return 0;
    }
    
    for (i, c) in capacity.iter().enumerate() {
        if sum <= *c {
            return (i + 1).try_into().unwrap();
        }
        sum -= *c;
    }
    0
}

#[cfg(test)]
mod test {
    use super::minimum_boxes;

    #[test]
    fn test_minimum_boxes() {
        let apples = vec![1,3,2];
        let capacity = vec![4,3,1,5,2];
        assert_eq!(minimum_boxes(&apples, &capacity), 2);
        let apples = vec![5,5,5];
        let capacity = vec![2,4,2,7];
        assert_eq!(minimum_boxes(&apples, &capacity), 4);
    }
}