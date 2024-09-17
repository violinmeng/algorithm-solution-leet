public class GuessGame {
    private var pick: Int

    public init(pick: Int) {
        self.pick = pick
    }

    func guess(_ num: Int) -> Int {
        if pick < num {
            -1
        } else if pick > num {
            1
        } else {
            0
        }
    }

    public func guessNumber(_ num: Int) -> Int {
        var left = 1
        var right = num
        while left < right {
            let mid = left + (right - left) / 2
            let result = guess(mid)
            if result == 0 {
                return mid
            } else if result == -1 {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
