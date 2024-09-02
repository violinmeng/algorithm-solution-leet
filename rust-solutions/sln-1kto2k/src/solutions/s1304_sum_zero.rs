
pub fn sum_zero(n: i32) -> Vec<i32> {    
    (((n & 1) ^ 1)..n/2+1).into_iter().map(|i| i).chain((1..n/2+1).into_iter().map(|i| -i)).collect()
}

#[test]
fn test_sum_zero() {
    assert_eq!(sum_zero(1).iter().sum::<i32>(), 0);
    assert_eq!(sum_zero(2).iter().sum::<i32>(), 0);
    assert_eq!(sum_zero(3).iter().sum::<i32>(), 0);
    assert_eq!(sum_zero(4).iter().sum::<i32>(), 0);
    assert_eq!(sum_zero(5).iter().sum::<i32>(), 0);
    assert_eq!(sum_zero(6).iter().sum::<i32>(), 0);
}