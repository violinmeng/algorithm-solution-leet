func merge(_ nums1: inout [Int], _ len1: Int, _ nums2: [Int], _ len2: Int) {
    // double pointers, one points the tail element of nums1
    // the other points to the tail of nums2
    var ptr1 = len1 - 1
    var ptr2 = len2 - 1

    // from the end of nums1 to fill the elements
    let total = len1 + len2 - 1

    // can not iterate n...1, becasue the final element muy be in nums2.
    // thus the element will not be moved to nums1
    for idx in stride(from: total, to: -1, by: -1) {
        // get the pointed elements of num1 and nums2, if the pointer is out of bounds, nil will receive.
        let ele1 = ptr1 >= 0 ? nums1[ptr1] : nil
        let ele2 = ptr2 >= 0 ? nums2[ptr2] : nil

        // only num1 have elements, just break and end the whole thing
        if ele2 == nil {
            break
        }

        var bigger: Int

        // get the bigger element between the pointed elements, and move the pointer, respectively
        // no force unwrapping version, better style of code, maybe.
        if let ue2 = ele2 {
            if let ue1 = ele1, ue1 > ue2 {
                ptr1 -= 1
                bigger = ue1
            } else {
                ptr2 -= 1
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
        nums1[idx] = bigger
    }
}
