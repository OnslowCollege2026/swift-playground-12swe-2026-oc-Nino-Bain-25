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
    print("6. Play Blackjack")
}

///This function takes the user input in the form of a number.
func menuChoice() -> Int{
    var menuReturn = 0
if let UserInput = readLine(), let userDecision = Int(UserInput) {
menuReturn = userDecision
}
return menuReturn
}



@main

struct SwiftPlayground {
static func main() {
    //The maximum amount of eggs, and the amount of eggs currently in stock.
let eggMaxing = 500
var eggStock = 20
var eggsSold = 0


//While menuRunning is = 1, the menu runs, keeping the program on.
var menuRunning = 1
while menuRunning == 1 {
    printMenu()
let UserInput = menuChoice()
if UserInput < 1 {
    print("Please enter a number from 1-6")
} else if UserInput > 6 {
    print("Please enter a number from 1-6")
} else {
    print("INVALID NUMBER! TRY AGAIN")
}
if UserInput == 5 {
    print("Goodbye, have a nice day.")
    menuRunning = 0
    }
else if UserInput == 1 {
    print("Please choose an amount of eggs to add.")
    
}
//eggs Im sellin.
else if UserInput == 2 {
print("Please choose an amount of eggs to sell")
let Input = menuChoice()
if Input > -1 && Input <= eggStock {}
}
}

}


}