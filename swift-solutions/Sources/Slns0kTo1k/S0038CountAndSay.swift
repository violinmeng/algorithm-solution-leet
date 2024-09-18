// recursive version
func countAndSay(_ num: Int) -> String {
    if num == 1 {
        return "1"
    }

    let lastStr = countAndSay(num - 1)
    var ans = ""
    var cur = lastStr.first
    var count = 0
    for char in lastStr {
        if char == cur {
            count += 1
        } else {
            ans.append("\(count)" + "\(cur ?? Character(""))")
            cur = char
            count = 1
        }
    }
    ans.append("\(count)" + "\(cur ?? Character(""))")
    return ans
}

func countAndSayIterator(_ num: Int) -> String {
    var pre = "1"

    for idx in 2 ... num {
        var count = 0
        var tmp = ""
        var current = pre.first

        for char in pre {
            if char == current {
                count += 1
            } else {
                tmp.append("\(count)" + "\(current ?? Character(""))")
                current = char
                count = 1
            }
        }
        tmp.append("\(count)" + "\(current ?? Character(""))")
        pre = tmp
    }
    return pre
}
