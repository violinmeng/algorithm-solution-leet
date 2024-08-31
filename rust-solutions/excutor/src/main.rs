use  sln_3kto4k::solutions::*;
fn main() {
    let apples = vec![1,3,2];
    let capacity = vec![4,3,1,5,2];
    // assert_eq!(minimum_boxes(apples, capacity), 2);
    println!("At least {} boxes from the candidates whose capacity are {:?} could hold the apples which the bags {:?} packed", minimum_boxes(&apples, &capacity), capacity, apples);
    let apples = vec![5,5,5];
    let capacity = vec![2,4,2,7];
    // assert_eq!(minimum_boxes(apples, capacity), 4);
    println!("At least {} boxes from the candidates whose capacity are {:?} could hold the apples which the bags {:?} packed", minimum_boxes(&apples, &capacity), capacity, apples);
}
