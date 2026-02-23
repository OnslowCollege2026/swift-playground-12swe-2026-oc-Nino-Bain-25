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
    print("7. Play Blackjack")
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
    print("Please choose an amount of eggs to add to stock.")
    let Input = menuChoice() 
    if Input + eggStock < eggMaxing {
eggStock = Input + eggStock
    } else if Input == 0{
print("No eggs added. What were you EGGspecting")
    } else if Input < 0 {
        print("Invalid number of eggs. If you want them gone, then go sell em!")
    }
    else {
        print("Maximum limit of eggs in stock is \(eggMaxing). Please enter a number that does not exceed the limit.")
    }
}
//eggs Im sellin.
else if UserInput == 2 {
print("Please choose an amount of eggs to sell")
let Input = menuChoice()
if Input > -1 && Input <= eggStock {
    eggsSold = eggsSold + eggStock
    eggStock = eggStock - Input
    print("You have sold \(Input) eggs. Well done!.")
}
}
//Shows how many eggs there are in stock.
else if UserInput == 3 {
    print("There are \(eggStock) eggs in stock.")
} 
/*Shows how many eggs have been sold. If the stock is empty, if the number of eggs sold is above 500, 
or no eggs have been sold, it gives a unique response.*/
else if UserInput == 4 {
    if eggsSold > 0 {
    print("You have sold a total of \(eggsSold) eggs.")}
    else if eggStock == 0 {
        print("Wow, you sold all \(eggsSold) eggs! good job.")
    }
    else if eggsSold < 500 {
        print("You sold a whopping \(eggsSold)! great job!")
    }
    else {
        print("You haven't sold anything yet! sell something first please.")
    }
} else if UserInput == 6 {
    eggsSold = 0
    eggStock = 500
    print("Shop refreshed.")} 
    
    
    
    //So I was a little bored and am programming blackjack. Is this more or less impressive than the eggs?
    else if UserInput == 7 {
print("Feature is unfinished. GIMME A MOMENT.")

var fullDeck = ["Joker"] 
let suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
let cardNumbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "King", "Queen", "Jack"]
for words in suits {
    for numbers in cardNumbers{
fullDeck.append("\(numbers) of \(words)")
}}
fullDeck.remove(at: 1)
var playDeck = [""]
for cards in fullDeck {
playDeck.append(cards)
}
playDeck.remove(at: 1)
let playerHand = [""]
for numbers in 1...2 {
print(playerHand, numbers)
}
} 

}

}


}