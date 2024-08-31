
use sln_3kto4k::solutions::result_array;

#[test]
fn result_array_test() {
    let nums = vec![2,1,3];
    let result = result_array(nums);
    assert_eq!(result, [2, 3, 1]);
}