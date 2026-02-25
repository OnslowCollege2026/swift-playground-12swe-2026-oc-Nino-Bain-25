// The Swift Programming Language
// https://docs.swift.org/swift-book

///Prints a bunch of stuff for me, for the menu to use.
func printMenu() {
    print("===Egg Shop===")
    print("1. Add eggs")
    print("2. Sell eggs")
    print("3. Show current stock")
    print("4. Show total eggs sold")
    print("5. Finish")
    print("6. Refresh shop")
}

///This function takes the user input in the form of a number.
func menuChoice() -> Int {
    var menuReturn = 0
    if let UserInput = readLine(), let userDecision = Int(UserInput) {
        menuReturn = userDecision
    }
    return menuReturn
}

///Shows the amount of eggs the user has sold, with different messages depending on how many they have sold.
/// Parametres:
/// EggSold: The amount of eggs the user has sold
/// EggStock: The amount of eggs left in stock.
func showStats(eggStock: Int, eggSold: Int) {
    if eggSold > 0 && eggSold <= 500 && eggStock > 0 {
        print("You have sold a total of \(eggSold) eggs!")
    } else if eggSold == 0 {
        print("You have not sold any eggs")
    } else if eggStock == 0 {
        print("You sold our whole stock of \(eggSold) eggs! Good job.")
    } else if eggSold >= 500 {
        print("Woah, you sold a whopping total of \(eggSold) eggs!")
    } else {
        print("Wait what?")
    }

}

///Adds eggs to the stock
/// Parametres:
/// eggStock: the amount of eggs left in stock
/// eggMaxing: the maximum amount of eggs the stock can have.
func addEggs(eggStock: Int, eggMaxing: Int) -> Int {
    print("Please choose an amount of eggs to add to stock.")
    let Input = menuChoice()
    if Input + eggStock <= eggMaxing {
        print("\(Input) eggs added to stock.")
        return Input
    } else if Input == 0 {
        print("No eggs added. What were you EGGspecting")
        return 0
    } else if Input < 0 {
        print("Invalid number of eggs. If you want them gone, then go sell em!")
        return 0
    } else {
        print(
            "Maximum limit of eggs in stock is \(eggMaxing). Please enter a number that does not exceed the limit."
        )
        return 0
    }

}
///Sells eggs (Mostly checks if the eggs break any limits, and print different messages if they do.)
/// parametre: eggStock: the amount of eggs in stock.
func sellEggs(eggStock: Int) -> Int {
    let Input = menuChoice()
    if Input > -1 && Input <= eggStock {
        print("You have sold \(Input) eggs. Well done!.")
        return Input

    } else if Input < -1 {
        print("Invalid number of eggs.")
        return 0
    } else if Input > eggStock {
        print("Not enough eggs in stock")
        return 0
    } else {
        return 0
    }
}
@main

struct SwiftPlayground {
    static func main() {
        //The maximum amount of eggs, and the amount of eggs currently in stock.
        let eggMaxing = 500
        let BaseStock = 20
        let BaseSold = 0
        var eggStock = BaseStock
        var eggsSold = BaseSold

        //While menuRunning is = 1, the menu runs, keeping the program on.
        var menuRunning = 1
        while menuRunning == 1 {
            printMenu()
            let UserInput = menuChoice()
            if UserInput < 1 {
                print("Please enter a number from 1-6")
            } else if UserInput > 6 {
                print("Please enter a number from 1-6")
            }
            if UserInput == 5 {
                print("Goodbye, have a nice day.")
                menuRunning = 0
            }

            //Adds eggs to the stock. Will not add eggs if it exceeds the egg limit.
            else if UserInput == 1 {
                eggStock = addEggs(eggStock: eggStock, eggMaxing: eggMaxing) + eggStock
            }
            //eggs Im sellin.
            else if UserInput == 2 {
                print("Please choose an amount of eggs to sell")
                let Input = sellEggs(eggStock: eggStock)
                eggsSold = eggsSold + Input
                eggStock = eggStock - Input
            }
            //Shows how many eggs there are in stock.
            else if UserInput == 3 {
                print("There are \(eggStock) eggs in stock.")
            }/*Shows how many eggs have been sold. If the stock is empty, if the number of eggs sold is above 500,
            or no eggs have been sold, it gives a unique response.*/
            else if UserInput == 4 {
                showStats(eggStock: eggStock, eggSold: eggsSold)
            } else if UserInput == 6 {
                eggsSold = BaseSold
                eggStock = BaseStock
                print("Shop refreshed.")
            }

        }
    }

}
