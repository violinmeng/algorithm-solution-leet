// recursive version
func countAndSay(_ n: Int) -> String {
    
    if n == 1 {
        return "1"
    }
    
    let lastStr = countAndSay(n-1);
    var ans = ""
    var cur = lastStr.first
    var count = 0
    for c in lastStr {
        if c == cur {
            count += 1
        } else {
            ans.append("\(count)"+"\(cur ?? Character(""))")
            cur = c
            count = 1
        }
    }
    ans.append("\(count)"+"\(cur ?? Character(""))")
    return ans
}


func countAndSay(_ n: Int) -> String {
    
    if n == 1 {
        return "1"
    }
    
    let lastStr = countAndSay(n-1);
    var ans = ""
    var cur = lastStr.first
    var count = 0
    for c in lastStr {
        if c == cur {
            count += 1
        } else {
            ans.append("\(count)"+"\(cur ?? Character(""))")
            cur = c
            count = 1
        }
    }
    ans.append("\(count)"+"\(cur ?? Character(""))")
    return ans
}

func countAndSayIterator(_ n: Int) -> String {
    var pre = "1"

    for i in 2...n {
        var count = 0
        var tmp = ""
        var current = pre.first
        
        for c in pre {
            if c == current {
                count += 1
            } else {
                tmp.append("\(count)"+"\(current ?? Character(""))")
                current = c
                count = 1
            }
        }
        tmp.append("\(count)"+"\(current ?? Character(""))")
        pre = tmp
    }
    return pre
}


print(countAndSay(30))

print(countAndSayIterator(4))