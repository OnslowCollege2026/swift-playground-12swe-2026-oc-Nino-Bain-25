// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    

    name: "SwiftPlayground",
    targets: [
        
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "SwiftPlayground"
        ),
    ]
)
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
if userNumber == 1 {}
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