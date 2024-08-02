
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    // double pointers, one points of the tail element of nums1
    // the other points to the tail of nums2
    var p1 = m - 1
    var p2 = n - 1

    // from the end of nums1 to fill the elements
    let total = m + n - 1

    // can not iterate n...1, becasue the final element muay be in nums2. 
    // thus the element will not be moved to nums1
    for i in stride(from: total, to: -1, by: -1) {

        // get the pointed elements of num1 and nums2, if the pointer is out of bounds, nil will receive.
        var e1 = p1 >= 0 ? nums1[p1] : nil
        var e2 = p2 >= 0 ? nums2[p2] : nil

        // only num1 have elements, just break and end the whole thing
        if e2 == nil {
            break;
        }

        var bigger:Int

        // get the bigger element between the pointed elements, and move the pointer, respectively
        // no force unwrapping version
        if let ue2 = e2 {
            if let ue1 = e1, ue1 > ue2 {
                p1 -= 1
                bigger = ue1
            } else {
                p2 -= 1
                bigger = ue2
            }
        } else {
            break
        }

        // get the bigger element between the pointed elements, and move the pointer, respectively
        // var bigger:Int
        // if e1 ==  nil || e1! < e2! {
        //     p2-=1
        //     bigger = e2!
        // } else {
        //     p1-=1
        //     bigger = e1!
        // }
        // mvoe the bigger one to the destination
        nums1[i] = bigger
    }
}