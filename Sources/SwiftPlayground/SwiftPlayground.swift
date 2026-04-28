import Foundation
///Prints the menu of options the user will be first presented with.
func printMenu() {
print("Welcome user, to the kumara shop!")
print("---------------------------------")
print("Please select an option:")
print("1. Make kumara sale")
print("2. Check remaining Stock")
print("3. Summary of sales")
print("4 Close program")
}

///Asks the user how much kumara they are purchasing, and returns the number if the amount of kumara is valid
/// Parametres
/// KumaraWeight: The weight of each kumara (100g) which we convert to dollars
/// KumaraPrice: The price of kumara per kg
/// KumaraStock: The amount of kumaras we have in stock
func sellKumara(kumaraStock: Double, kumaraWeight: Double, kumaraPrice: Double) -> Int {
print("How many kumaras is being bought? (Kumaras are 100g each, $3 per Kumara)")
if let userInput = readLine(), let userNumber = Int(userInput) {
guard userNumber < 1 || Double(userNumber) * kumaraWeight >= kumaraStock + 1 else {

return userNumber
}
print("You must sell at least one kumara, and not more kumara than we have in stock. (\(kumaraStock / kumaraWeight) kumara left in stock)")
return 0
}
print("Please enter an actual number.")
return 0
}

///Asks the user how many bags they want to buy, with an absolute minimum of one, or another bag per kilogram
/// Parametres: 
/// KumaraBeingBought: How much kumara that is being bought
/// BagCapacity: How much kumara each bag can hold
func bagSales(kumaraBeingBought: Int, BagCapacity: Double) -> Int {
    print("How many bags are you buying? You must buy at least one bag, or more per extra kilogram of kumara")
    var bagRecommendation = 0

    //Not my best work with this recommendation system, pls let me know in the future how this might be done better. Still functional thought.
    if kumaraBeingBought < 50 {
    bagRecommendation = 1
    } else if kumaraBeingBought < 100 {
        bagRecommendation = 2
    } else {
        bagRecommendation = 3
    }

print("Recommended amount of bags: \(bagRecommendation)")
if let userInput = readLine(), let userNumber = Int(userInput) {
guard userNumber < bagRecommendation else {
return userNumber
}
print("Please make sure you get enough bags to hold your kumara.")
return 0
}
print("Invalid amount of bags. Please make sure you have enough bags for the kumara you are buying..")
return 0

}

///Tells the user how much kumara is left in stock, as well as how many individual kumaras there are.
/// Parametres:
/// kumaraStock: The amount of kumara left in stock
/// kumaraWeight: the amount each kumara weighs.
func stockCheck(kumaraStock: Double, kumaraWeight: Double) {
if kumaraStock > 0 {
print("In the stock, there are \(kumaraStock / 1000) kilograms of kumara.")
if kumaraStock == 100 {
    print("There is only 1 kumara left in the stock")
}

else {
    //Shows how many individual kumaras there are
    print("There are \(Int(kumaraStock / kumaraWeight)) kumara left in stock.")
}} else {
    //In the event the stock is completely out of kumara.
    print("There is no kumara left in Stock.")
}

}




///Prints out the total sales, average kumara per bag, and money made
///Paremetres:
/// kumaraSalesWeight: The list of weights of kumara sold
/// kumaraSalesBags: The list of amounts of bags sold
/// TotalSales: The total amount of sales that has been made
/// KumaraWeight: The weight of each kumara
/// kumaraPrice: The price of each kumara
/// bagPrice: The price of each bag.
func totality(kumaraSalesWeight: [Double], KumaraSalesBags: [Int], TotalSales: Int, kumaraWeight: Double, kumaraPrice: Double, bagPrice: Double) {
if TotalSales > 0 {
print("These are the sales you have made today:")
var totalBags = 0
var totalWeight = 0.0
var totalPriced = 0.0

for number in 1...TotalSales {

//The total price of the order
let totalPrice = (kumaraSalesWeight[number - 1] * kumaraPrice) + (Double(KumaraSalesBags[number - 1]) * bagPrice)

print("\(number). Kumara sold: \(kumaraSalesWeight[number - 1] * 0.001)kg, \(kumaraSalesWeight[number - 1] / kumaraWeight) kumaras")
print("  Bags sold: \(KumaraSalesBags[number - 1]) bags.")
print("Average kumara per bag: \((kumaraSalesWeight[number - 1] * 0.01) / Double(KumaraSalesBags[number - 1]))")
print("  Total cost: \(totalPrice)")

//Adds to totals for the final score
totalPriced = totalPrice + totalPriced
totalWeight = kumaraSalesWeight[number - 1] + totalWeight
totalBags = totalBags + KumaraSalesBags[number - 1]
}
print("------------")
print("Final stats:")
print("Total earnings: $\(totalPriced)")
print("Total kumara sold: \(totalWeight * 0.001)kg, or \(totalWeight / kumaraWeight) kumaras")
print("Total bags sold: \(totalBags)")
print("Average kumara per bag: \((totalWeight * 0.01) / Double(totalBags))")
}
else {

    print("You haven't sold anything yet.")
}




}

///WORK ON THE OTHER PARTS OF THE PROGRAM, THE OTHER MENU OPTIONS

@main
struct SwiftPlayground {
    static func main() throws {

//Constants and variables
/*Due to a weird issue where values would add an extremely small decimal value to calculations, 
all the measurements here are in grams, which corrects it for some reason. */
var kumaraStock = 12000.0
let kumaraPrice = 0.003
let kumaraWeight = 100.0
let bagPrice = 0.5
var totalSales = 0
var kumaraSalesWeight: [Double] = []
var kumaraSalesBags: [Int] = []
let BagCapacity = 5000.0

//The variable that keeps the while loop running
var programRunning = true

while programRunning {
printMenu()
if let userInput = readLine(), 
    let userNumber = Int(userInput) {

        //Option to sell kumara if user selects "1"
if userNumber == 1 {
let numberCheck = sellKumara(kumaraStock: kumaraStock, kumaraWeight: kumaraWeight, kumaraPrice: kumaraPrice )
if numberCheck != 0 {
    print("Selling \(numberCheck) kumaras.")
    let bagAmount = bagSales(kumaraBeingBought: numberCheck, BagCapacity: BagCapacity)

    if bagAmount > 0 {

        //If all steps are completed successfully, all the stats are updated.
 //The stock is subtracted from
kumaraStock = kumaraStock - (Double(numberCheck) * 100)

//The amount of kumara in weight we have sold is updated
kumaraSalesWeight.append(Double(numberCheck) * kumaraWeight)

//And the amount of bags we sold in this sale gets updated as well.
kumaraSalesBags.append(bagAmount)

//Also increases the amount of total sales that have been made
totalSales = totalSales + 1

//Prints messages telling the user how much has been sold, and what price it is.
print("Sold \(numberCheck) kumara for $\(Double(numberCheck) * kumaraWeight * kumaraPrice)")
print("Also sold \(bagAmount) bags for a price of \(bagPrice * Double(bagAmount))")
print("Total money made: $\((Double(numberCheck) * kumaraWeight * kumaraPrice) + (bagPrice * Double(bagAmount)))")
    }
}

}
//Option to check how much kumara is in stock if user presses 2
else if userNumber == 2 {stockCheck(kumaraStock: kumaraStock, kumaraWeight: kumaraWeight)}


//Option to show the sale history, as well as the average kumara amount in each bag, and total stats.
else if userNumber == 3 {
//TOTALITY
    totality(kumaraSalesWeight: kumaraSalesWeight, KumaraSalesBags: kumaraSalesBags,TotalSales: totalSales, 
    kumaraWeight: kumaraWeight, kumaraPrice: kumaraPrice, bagPrice: bagPrice)
}


//Quits the program, does not show stats. 
else if userNumber == 4 {
    programRunning = false
    print("Goodbye!")
}
else {
    print("Invalid Number, please try again.")
}




    } 
    else {print("Invalid option")}

}


}









    }