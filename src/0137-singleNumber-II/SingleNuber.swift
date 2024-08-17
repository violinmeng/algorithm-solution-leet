// The intuitive way of solving this problem is record the count of the same number with a map.
// Then find and return the number only presents one time.

// There is a tricky way for this problem.
// As we know, a number is a sequence of bits, each bit is 0 or 1
// so for each bit, we add them altogether, and reduce the result modulo 3.
// the result is 0 or 1, and it is equal with the bit of the single number in the same location.
// so we joint the bits and we get the result.

// It need to notice that numbers in the array are within the range of 0 to 2^32
// so could we just calculate the 32 bits?
// the answer is yes or no.
// if the bit width of the Int type which defined by the language specifications is 32
// then the answer is yes, it can deal with 2's complement correctly.
// otherwise, we need to deal with the negative case manually.
// That's why we must take the case in count when we solve this problem in python.
// The bit width of int type in python is unlimited and dynamically allocated.

// For swift, the Int type's bit width is platform specified. it could be 32 or 64.
// so we can calculate all the bits by using bitWidth property.
// Or, we can use Int32 type store the result temporarily. then up cast to Int type.
func singleNumber(_ nums: [Int]) -> Int {
    var ans = 0
    //var ans: Int32 = 0

    for i in 0..<Int.bitWidth {
        var total = 0
        for num in nums {
            total += ((num >> i) & 1)
        }
        if (total % 3) > 0 {
            ans |= (1 << i)
        }
    }

    return ans
    // return Int(ans)
}

// the solution above, calculates one bit, we need to loop the array one time.
// Is there a way to calculates all of the 32 bits once.
// so we need bits record the temporary result. because, the accumulate result of each bit could be 0, 1, 2.
// when reach to 3, it will back to 0, we reduce the result modulo 3 by this mean.
// thus, we need two bits to store one bit result. we can use two Int variables store the result.
// for any of the bit, it has the following cases:
// TEMP STORE  INCOMING BIT  NEW TEMP STORE
// ai  bi            xi        ai' bi'
// 0   0             0          0   0
// 0   0             1          0   1
// 0   1             0          0   1
// 0   1             1          1   0
// 1   0             0          1   0
// 1   0             1          0   0
// we can get transition equation:
// ai' = (~ai & bi & xi ) | (ai & ~bi & ~xi)
// bi' = ~ai & (bi ^ xi)

func singleNumber1(_ nums: [Int]) -> Int {
    var tuple = (0, 0)
    var a = 0
    var b = 0
    for num in nums {
        (a, b) = ((~a & b & num) | (a & ~b & ~num) , (~a & (b ^ num)))
    }
    return b 
}

// the transition equation for ai is a little complicated.
// we can calculate the bi' first, and then use the ai, bi' and xi to construct the equation of ai'
// we can get ai' =  ~bi' & ((~ai & xi) | (ai & ~xi)) = ~bi' & ai ^ xi

func singleNumber2(_ nums: [Int]) -> Int {
    var a = 0
    var b = 0
    for num in nums {
        b = (b ^ num) & ~a
        a = (a ^ num) & ~b
    }
    return b
}


print(singleNumber([2,2,3,2]))
print(singleNumber([0,1,0,1,0,1,99]))
print(singleNumber([30000,500,100,30000,100,30000,100]))
print(singleNumber([-2,-2,1,1,4,1,4,4,-4,-2]))

print(singleNumber1([2,2,3,2]))
print(singleNumber1([0,1,0,1,0,1,99]))
print(singleNumber1([30000,500,100,30000,100,30000,100]))
print(singleNumber1([-2,-2,1,1,4,1,4,4,-4,-2]))

print(singleNumber2([2,2,3,2]))
print(singleNumber2([0,1,0,1,0,1,99]))
print(singleNumber2([30000,500,100,30000,100,30000,100]))
print(singleNumber2([-2,-2,1,1,4,1,4,4,-4,-2]))