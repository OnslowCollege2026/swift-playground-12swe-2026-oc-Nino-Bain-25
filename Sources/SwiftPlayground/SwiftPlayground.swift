// The Swift Programming Language
// https://docs.swift.org/swift-book


func print(Board: [[String]]) {
Board.forEach {Line in
print("\(Line[0]) | \(Line[1]) | \(Line[2])")
print("--+---+--")

}
print("")
}


func askForPosition(board: [[String]]) -> [Int] {
    while true{
print("Please enter row number (1-3)")
let userInput = readLine()!
let rowNumber = Int(userInput)! - 1

print("Please enter the column number: (1-3)")
let userInput2 = readLine()!
let columnNumber = Int(userInput2)! - 1
if board [rowNumber][columnNumber] == "." {
    return [rowNumber, columnNumber]
}}
}
@main

struct SwiftPlayground {
static func main() {

var player = "O"
var board = [
[".",".","."],
[".",".","."],
[".",".","."],
]
print(Board: board)
//Ask for the user's move

while true {
let position = askForPosition(board:board)
board[position[0]][position[1]] = player

if player == "O" {
    player = "X"
} else {
    player = "O"
}
print(Board: board)


}


}
}