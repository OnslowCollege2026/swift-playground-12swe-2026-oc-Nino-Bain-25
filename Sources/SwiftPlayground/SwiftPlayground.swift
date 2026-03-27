import Foundation



///Checks if the user's answer is correct
/// Parametres:
/// PossibleAnswers: The possible answers to the question
/// enteredAnswer
func answerCheck(enteredAnswer:Int, answerOrder: [String], questionVocab: [String] ) -> Bool {
if enteredAnswer > 0 && enteredAnswer < 5 {
if answerOrder[enteredAnswer - 1] == questionVocab[1] {
    return true
} else {
print("Incorrect. The real answer was \(questionVocab[1]). Try again.")
    return false
}}
else {
    print("Invalid. Please enter an answer between 1-4. Try again later.")
    return false
}
}


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

//Counter because Im bad at coding
var counter = 0


//Loop until all vocab questions have been asked
for i in vocabulary {
counter += 1

    //The order of the answers the question will give the player
    var answerOrder: [String] = []
    //The possible answers the question could give the player
    var possibleAnswers: [String] = i

    //The amount of times the upcoming for loop will run (How many possible answers there are)
    let loopruns: Int = possibleAnswers.count - 1

    //Removes the english word as a possible answer
    possibleAnswers.remove(at: 0)
    

//Adds a random answer from possible answers into the answer order, and then removes that answer from the possible answers.
for _ in 1...loopruns {
    let randomNumber = Int.random(in: 0...(possibleAnswers.count - 1))
    answerOrder.append(possibleAnswers[randomNumber])
    possibleAnswers.remove(at: randomNumber)

}
//Show the question and present possible answers
print("What is \(i[0]) in Spanish?")
print("Which is it: 1.\(answerOrder[0]), 2.\(answerOrder[1]), 3.\(answerOrder[2]), or 4.\(answerOrder[3])")
if let userInput = readLine(), 
let userNumber = Int(userInput) {

//Checks if the answer was correct
if answerCheck(enteredAnswer: userNumber, answerOrder: answerOrder, questionVocab: i) == true {
print("That is correct! Well done.")
} else {
    incorrectIndices.append(counter)
}

} else {
    //Marks the question as "Wrong" if the user's input is invalid.
    print("Invalid answer. Please try again")
    incorrectIndices.append(counter)
}

}

//Repeats the questions the player failed.
counter = 0
for failedQuestions in incorrectIndices {
    print(failedQuestions)
counter += 1

    //The order of the answers the question will give the player
    var answerOrder: [String] = []
    //The possible answers the question could give the player
    var possibleAnswers: [String] = vocabulary[failedQuestions]

    //The amount of times the upcoming for loop will run (How many possible answers there are)
    let loopruns: Int = possibleAnswers.count - 1

    //Removes the english word as a possible answer
    possibleAnswers.remove(at: 0)
    

//Adds a random answer from possible answers into the answer order, and then removes that answer from the possible answers.
for _ in 1...loopruns {
    let randomNumber = Int.random(in: 0...(possibleAnswers.count - 1))
    answerOrder.append(possibleAnswers[randomNumber])
    possibleAnswers.remove(at: randomNumber)

}
//Show the question and present possible answers
print("What is \(vocabulary[failedQuestions][0]) in Spanish?")
print("Which is it: 1.\(answerOrder[0]), 2.\(answerOrder[1]), 3.\(answerOrder[2]), or 4.\(answerOrder[3])")
if let userInput = readLine(), 
let userNumber = Int(userInput) {

//Checks if the answer was correct
if answerCheck(enteredAnswer: userNumber, answerOrder: answerOrder, questionVocab: vocabulary[failedQuestions]) == true {
print("That is correct! Well done.")
} else {
    incorrectIndices.append(counter)
}

} else {
    //Marks the question as "Wrong" if the user's input is invalid.
    print("Invalid answer. Please try again")
    incorrectIndices.append(counter)
}

}






// If NOT, then make a note of the question to ask again later.


}
}