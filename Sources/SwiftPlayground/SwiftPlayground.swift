import Foundation

@main
struct SwiftPlayground {
    static func main() throws {

        // The size of the board (width and height).
        print("How big should the board be? (Default 6)")
        let defaultSize = 6
        let size = playerSettings(defaultNumber: defaultSize, maxSetting: 100, minsetting: 0)

        //The amount of ships on the board
        print("How many ships in the sea? (Default 1)")
        let defaultShipCount = 1
        let shipCount = playerSettings(
            defaultNumber: defaultShipCount, maxSetting: (size * size), minsetting: 0)

        // The maximum number of guesses the user can make.
        print("How many guesses do you want (Default 5)")
        let defaultGuesses = 5
        let maximumGuesses = playerSettings(
            defaultNumber: defaultGuesses, maxSetting: 100, minsetting: shipCount)

        // The board you are playing on.
        let ocean = randomShipping(size: size, shipCount: shipCount)

        // A record of the guesses that have been made.
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

        printBoard(guesses)
        printBoard(ocean)
        // Allow the user to make a certain number of guesses.
        var progress = 1
        var shipsSunk = 0
        while progress <= maximumGuesses && shipsSunk < shipCount {
            // Ask for the row and column number.
            print("\(progress): Please enter a row number, press Enter, then a column number: ")

            // Get the user's input for both the row and column.
            // If the input is not usable, tell them to try again.
            guard let userInput = readLine(),
                let row = Int(userInput),
                let userInput2 = readLine(),
                let col = Int(userInput2)
            else {
                print("Your guesses are invalid. Please try again.")
                continue
            }

            // By this point in the code, the row and col must be valid integers.
            // Use processGuess to check that they are also valid guesses.
            guesses = processGuess(row: row, col: col, ocean: ocean, guesses: guesses)
            if guesses[row - 1][col - 1] == "X" {
                shipsSunk = shipsSunk + 1
            }
            // Print the updated guesses board, then go to the next move.
            printBoard(guesses)
            progress = progress + 1
        }
        if shipsSunk == shipCount {
            print("You Win! well done.")
        } else {
            print("ohh, better luck next time.")
        }
    }
}
/// Parameter:
/// - board: The 2D grid to display.
func printBoard(_ board: [[String]]) {
    var columnLabels = "  "
    for i in 1...board.count {
        columnLabels = columnLabels + "\(i) "
    }
    print(columnLabels)

    for (index, row) in board.enumerated() {
        var rowString = "\(index + 1) "
        for cell in row {
            rowString = rowString + cell + " "
        }
        print(rowString)
    }
}
/// Parameters:
/// - row: The row index for the guess.
/// - col: The column index for the guess.
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: The updated guesses grid after the guess is applied.
func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]]) -> [[String]] {
    // Make sure the row and column exist. If not, exit this function early.
    guard row >= 1, row <= ocean.count, col >= 1, col <= ocean[0].count else {
        print("Your guess is invalid. Try again.")
        return guesses
    }

    // Make sure that the user hasn't already guessed the position.
    // If not, exit this function early.
    guard guesses[row - 1][col - 1] != "O" && guesses[row - 1][col - 1] != "X" else {
        print("You have already guessed that position. Try again.")
        return guesses
    }

    // Make sure that the user hasn't missed the battleship.
    // If not, return an updated guesses table including the miss.
    guard ocean[row - 1][col - 1] != "~" else {
        print("MISS!")
        var newGuesses = guesses
        newGuesses[row - 1][col - 1] = "O"
        return newGuesses
    }

    // If the code hasn't returned by now, the player must have hit a ship.
    print("You've sunk my battleship!")
    var newGuesses = guesses
    newGuesses[row - 1][col - 1] = "X"
    return newGuesses
}
/// Parameters:
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: How many ships remain unhit.
func remainingShips(in ocean: [[String]], guesses: [[String]]) -> Int {
    var shipsCount = 0
    for row in 0...ocean.count - 1 {
        for col in 0...row {
            if ocean[row][col] == "S" {
                shipsCount = shipsCount + 1
            }
        }
    }

    var hitCount = 0
    for row in 0...guesses.count - 1 {
        for col in 0...row {
            if guesses[row][col] == "X" {
                hitCount = hitCount + 1
            }
        }
    }

    return shipsCount - hitCount
}
///Creates the board and randomly places ships around it.
func randomShipping(size: Int, shipCount: Int) -> [[String]] {
    var randomOcean: [[String]] = Array(repeating: Array(repeating: "~", count: size), count: size)
    for var i in 1...shipCount {
        let row = Int.random(in: 0...size - 1)
        let col = Int.random(in: 0...size - 1)
        if randomOcean[row][col] != "S" {
            randomOcean[row][col] = "S"
        } else {
            i = i + 1
        }

    }

    return randomOcean
}

func playerSettings(defaultNumber: Int, maxSetting: Int, minsetting: Int) -> Int {

    if let setting = readLine(), let settingChoice = Int(setting) {
        if settingChoice <= maxSetting && settingChoice >= minsetting {
            print("Set to \(settingChoice).")

            return settingChoice
        } else if settingChoice >= maxSetting {

            print("Number too big. Set to smaller number (\(maxSetting - 1))")
            return maxSetting - 1
        } else {
            print("Invalid number. Set to default number (\(defaultNumber)).")
            return defaultNumber

        }

    } else {
        print("Invalid number. Set to default number (\(defaultNumber))")
        return defaultNumber
    }

}
