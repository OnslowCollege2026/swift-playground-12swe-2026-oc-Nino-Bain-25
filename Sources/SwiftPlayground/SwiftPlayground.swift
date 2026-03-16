///Asks the user for a number
func coordInput() -> Int{
if let userInput = readLine(), let coord = Int(userInput) {
return coord

}
else {
    return 0
}



}



@main

struct SwiftPlayground {
    static func main() {
    var board: [[String]]
    let size = 6
    board = Array(repeating: Array(repeating: "~", count: size), count: size)
    var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)
    
    board[1][1] = "S"
    board[2][1] = "S"
    board[3][1] = "S"
    board[5][5] = "S"
    board[5][4] = "S"
    board[5][3] = "S"
    board[5][2] = "S"
    board[2][3] = "S"
    board[3][3] = "S"
   var correctGueses = 0
while correctGueses != 9 {
guesses.forEach { row in
    [row].forEach {number in
    print(number)



    }
    }
    

}


    }}