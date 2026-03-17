///Asks the user for a number
func coordInput() -> Int{
if let userInput = readLine(), let coord = Int(userInput) {
return coord

}

return 7


}

func PrintBoard(_ board: [[String]]) {
    var columnlables = ""
    for i in 0...board.count {
        columnlables = columnlables + "\(i)"
    }
    print (columnlables)
}

func processGuess(row: Int, col: Int, Board: [[String]], guesses: [[String]]) -> [[String]] {
guard row >= 1, row <= Board.count, col >= 1, col <= Board[0].count else {
print("INVALID GUESS")
return guesses
}
guard guesses[row - 1][col - 1] == "O" || guesses[row - 1][col - 1] == "X" else {
    print("You already guessed that spot, try again.")
}

}



@main

struct SwiftPlayground {
    static func main() {
        //Creates the board you ar playing on
    var board: [[String]]
    let size = 6
    board = Array(repeating: Array(repeating: "~", count: size), count: size)
//Creates the variable that the board
    var guesses = board
    
    //Places ships for player to find
    board[1][1] = "S"
    board[2][1] = "S"
    board[3][1] = "S"
    board[5][5] = "S"
    board[5][4] = "S"
    board[5][3] = "S"
    board[5][2] = "S"
    board[2][3] = "S"
    board[3][3] = "S"

func printBoard(board: board)

var correctGueses = 0
while correctGueses != 9 {
guesses.forEach { row in
    [row].forEach {number in
    print(number)



    }
    }
    

}


    }}