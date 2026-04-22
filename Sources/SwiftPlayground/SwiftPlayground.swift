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

func sellKumara(kumaraStock: Double, kumaraWeight: Double) -> Int {
print("How many kumaras is being bought? (Kumaras are 100g each, $3 per Kumara)")
if let userInput = readLine(), let userNumber = Int(userInput) {
guard userNumber > 0 && Double(userNumber) * 0.1 <= kumaraStock else {
print("Sold \(userNumber) kumara.")
return userNumber
}
print("Invalid number, please try again.")
return 0
}
print("Invalid number, please try again.")
return 0
}





@main
struct SwiftPlayground {
    static func main() throws {

//Constants and variables
var kumaraStock = 12.0
let kumaraPrice = 3.0
let kumaraWeight = 0.1
let bagPrice = 0.5
var totalSales = 0
var kumaraSalesWeight: [Int] = []
var kumaraSalesBags: [Int] = []

//The variable that keeps the while loop running
var programRunning = true

while programRunning {
printMenu()
if let userInput = readLine(), 
    let userNumber = Int(userInput) {
if userNumber == 1 {
let numberCheck = sellKumara(kumaraStock: kumaraStock, kumaraWeight: kumaraWeight )
if numberCheck != 0 {
kumaraStock = kumaraStock - (Double(numberCheck) * 0.1)

}

}
else if userNumber == 2 {}
else if userNumber == 3 {}
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