func validUTF8(_ data:[Int]) -> Bool {
    
    var header = 0
    for d in data {
        if header & 0b10000000 == 0b10000000 {
            if d & 0b11000000 != 0b10000000 {
                return false
            }
            header <<= 1
        } else {
            
            if d < 128 {
                continue
            }
            if d < 192 || d >= 248 {
                return false
            }
            header = d << 1
        }
    }
    
    print(header)
    return header & 0b10000000 == 0b00000000
    
}

print(validUTF8([237]))
print(validUTF8([197,130,1]))
print(validUTF8([235,140,4]))