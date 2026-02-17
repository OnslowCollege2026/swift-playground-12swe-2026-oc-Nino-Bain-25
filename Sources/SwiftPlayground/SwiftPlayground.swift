// The Swift Programming Language
// https://docs.swift.org/swift-book



func readNumber(prompt: String) -> Double {
    
var returnValue = -1.0
guard let UserInputHeight = readLine() , let Number = Double(UserInputHeight) else {
    print("Invalid number")
    return readNumber(prompt: prompt)
}
returnValue = Number
return returnValue
}
func showWelcome() {
    print("This program calculates room area and volume")
}
func printdivider() {
    print("--------")
}
func printUnitNotes() {
    print("All measurements are in metres")
}
func printGoodbye() {
    print("Done. Thanks for using the calculator.")
}
///Parameters: 
/// length: The length of the room in m3
/// Width:The width of the school in m3
/// Height: NO REALLY
func roomVolume(length: Double, Width:Double, Height: Double) -> Double {
    ///Shouldve used three slashes in the example.
    return length * Width * Height
}
///Parameters:
/// Length: the length of the room in m3
/// Width: The width of the room in m3
func printArea(length: Double, Width: Double) -> Double {
    ///Calculates area
    return length * Width
}
/// Checks the size of the room
/// Parametre: The Volume of the room in m3
/// Returns: true or false depending on if the room is smaller or larger than 60.
func isRoomSmall(volume: Double) -> Bool {
    return volume < 60
}
///The parametre is a percentage, and it returns a number in metres, which is reduced from the original number.
/// Parametres:
/// Original: The OG size in metres
/// reductionPercentage: a percentage that the original size will be reduced by
func reducedHeight(original: Double, reductionPercentage: Double) -> Double {
    let multiplier = (100 - reductionPercentage) / 100
    return original * multiplier
}
@main

struct SwiftPlayground {
static func main() {
        
        // Part 1 
        showWelcome()
//Constants for tech room right now
let roomLength = 6.0
let roomWidth = 4.5
let roomHeight = 2.7
let TechArea = printArea(length: roomLength, Width: roomWidth)

//Prints room size
print ("The room is \(TechArea)m2")
print("The room is also \(TechArea * roomHeight)m3")

//Part 2
//Asks user how big the room they are calculating is
print ("Please enter the rooms height, length and width.")
printUnitNotes()
if let UserInputHeight = readLine() , let UserRoomHeight = Double(UserInputHeight) {
    if let UserInputLength = readLine(), let UserRoomLength = Double(UserInputLength) {
        if let UserInputWidth = readLine(), let UserRoomWidth = Double(UserInputWidth) {
            let UserRoomVolume = UserRoomHeight * UserRoomLength * UserRoomWidth
            
            //Tells you the end result
            printdivider()
            print("Summary")
            printdivider()
            print("Your room has a volume of \(UserRoomVolume)m3")
        }
    }
}

    }




} 





    
