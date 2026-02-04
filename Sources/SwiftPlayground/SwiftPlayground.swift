// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        print("Hello, world!")
        // Part 1 
print ("hello world") 
//Constants for tech room right now
let roomLength = 6.0
let roomWidth = 4.5
let roomHeight = 2.7
let TechArea = (roomLength) * (roomWidth)

//Prints room size
print ("The room is \(TechArea)m2")
print("The room is also \(TechArea * roomHeight)m3")

//Part 2
//Asks user how big the room they are calculating is
print ("Please enter the rooms height, length and width.")
if let UserInputHeight = readLine() , let UserRoomHeight = Double(UserInputHeight) {
    if let UserInputLength = readLine(), let UserRoomLength = Double(UserInputLength) {
        if let UserInputWidth = readLine(), let UserRoomWidth = Double(UserInputWidth) {
            let UserRoomVolume = UserRoomHeight * UserRoomLength * UserRoomWidth
            print("Your room has a volume of \(UserRoomVolume)m3")
        }
    }
}

    }
}
