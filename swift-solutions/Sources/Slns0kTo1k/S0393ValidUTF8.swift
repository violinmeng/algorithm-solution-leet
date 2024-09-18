func validUTF8(_ data: [Int]) -> Bool {
    var header = 0
    for byte in data {
        if header & 0b1000_0000 == 0b1000_0000 {
            if byte & 0b1100_0000 != 0b1000_0000 {
                return false
            }
            header <<= 1
        } else {
            if byte < 128 {
                continue
            }
            if byte < 192 || byte >= 248 {
                return false
            }
            header = byte << 1
        }
    }

    print(header)
    return header & 0b1000_0000 == 0b0000_0000
}
