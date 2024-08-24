use std::convert::TryInto;
// The solution is pretty intuitive and simple.
// the given string has no duplicated character.
// so we can use an map to keep the mapping from each character and its index.
// we can then iterate through the second string,
// for each character, we can find its index in the map,
// and then we can get the difference between the index and the current index.
// the sum of all differences is the result.
pub fn find_permutation_difference(s: String, t: String) -> i32 {
    let mut s_counts = [0; 26];
    for (i, c) in s.chars().enumerate() {
        s_counts[c as usize - 'a' as usize] += i;
    }
    let mut diff = 0;
    for (i, c) in t.chars().enumerate() {
        diff += s_counts[c as usize - 'a' as usize].abs_diff(i);
    }
    diff.try_into().unwrap()
}

fn main() {
    let s = "abc".to_string();
    let t = "bac".to_string();
    println!("1: {}", find_permutation_difference(s, t));
    let s = "abcde".to_string();
    let t = "edbac".to_string();
    println!("2: {}", find_permutation_difference(s, t));
}