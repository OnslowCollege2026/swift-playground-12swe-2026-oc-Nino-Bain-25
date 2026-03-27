import Foundation



///Checks if the user's answer is correct
/// Parametres:
/// vocabulary: The vocabulary and possible answers the user is trying to guess
/// 


@main
struct SwiftPlayground {
    static func main() throws {

//Constants and variables
//Target language, and correct and wrong answers
let vocabulary = [
["Hello", "Hola", "Buenas dias", "Holo", "Bonjour"],
["Good Morning", "Buenas dias", "Buenas tardes", "Hola", "Buenas noches"],
["Good afternoon", "Buenas tardes", "Buenas noches", "Buenas dias", "Hola"],
["Good evening/ good night", "Buenas noches", "Buenas tardes", "Buenas dias", "Hola"],
["Day", "Dia", "Noche", "Acotar", "Magicians red"]
]
//The indices of the question the user got wrong
var incorrectIndices: [Int] = []

//Prints a lil greeting
print("Welcome to duolingo budget.")

//Loop until all vocab questions have been asked
for i in vocabulary {
   

    //The order of the answers the question will give the player
    var answerOrder: [String] = []
    //The possible answers the question could give the player
    var possibleAnswers: [String] = i
    let loopruns: Int = possibleAnswers.count - 1
    possibleAnswers.remove(at: 0)
    

//Adds a random answer from possible answers into the answer order, and then removes that answer from the possible answers.
for h in 1...loopruns {
    let randomNumber = Int.random(in: 0...(possibleAnswers.count - 1))
    print(randomNumber)
    answerOrder.append(possibleAnswers[randomNumber])
    possibleAnswers.remove(at: randomNumber)

}
 print("What is \(i[0]) in Spanish?")
print("Which is it: \(answerOrder[0]), \(answerOrder[1]), \(answerOrder[2]), or \(answerOrder[3])")


}


//SHow the question

//Present the possible answers    

//Check if the user guessed the correct answer

// If NOT, then make a note of the question to ask again later.


}
}