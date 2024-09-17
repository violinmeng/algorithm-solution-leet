func generateParenthesis(_ num: Int) -> [String] {
    // image there is a tree, the root node is empty
    //                   ""
    //                 /     \
    //               "("     ")"            layer1
    //               / \     / \
    //             "(" ")" "(" ")"          layer2
    //             ................         layer2*n
    // like the graph above.
    // so we can traversal all the path from root to leaf node.
    // and filter out those not validate.
    // those left out are the final answer.

    var res: [String] = []
    DFS(open: num, close: num, str: "", res: &res)
    return res
}

func DFS(open: Int, close: Int, str: String, res: inout [String]) {
    if open == 0, close == 0 {
        res.append(str)
        return
    }

    if open > 0 {
        // If we have not added all the left brace yet, we just add it.
        let nstr = str + "("
        DFS(open: open - 1, close: close, str: nstr, res: &res)
    }

    if open < close {
        // Those left braces we added must be more than those added right braces
        // then we can add the right brace
        let nstr = str + ")"
        DFS(open: open, close: close - 1, str: nstr, res: &res)
    }
}
