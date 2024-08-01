class GuessGame {

    private var pick:Int

    init(pick:Int) {
        self.pick = pick;
    }

    func guess(_ num:Int) -> Int {
        if pick < num {
            return -1
        } else if pick > num {
            return 1
        } else {
            return 0
        }
    }

    func guessNumber(_ n:Int) -> Int {
        var left = 1
        var right = n
        while (left < right) {
            let mid = left + (right - left) / 2
            let re = guess(mid)
            if re == 0 {
                return mid
            } else if re == -1 {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left 
    }
}

var game = GuessGame(50)
print(game.guessNumber(1000))
print(game.guessNumber(500))

var game1 = GuessGame(2)
print(game.guessNumber(2))
