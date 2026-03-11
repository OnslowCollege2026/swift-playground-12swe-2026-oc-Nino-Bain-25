///Adds up all integers in a collumn in a 2D array. Does not include rows that 
/// do not have a value in that column.
func collumnTotal (table: [[Int]], column: Int) -> Int {
var collumnTotality = 0
table[column].forEach {row in
if table[column][row] =
}



return 0
}






@main

struct SwiftPlayground {
    static func main() {
let temperatures = [
    [2.0, 4.0, 6.0],
    [8.0, 10.0, 12.0],
    [14.0, 16.0, 18.0]
]

print(temperatures[0])
print(temperatures[1][2])
print(temperatures[2][1])
var averagedtemp = 0.0
temperatures[1].forEach {temp in
averagedtemp = averagedtemp + temp

}
averagedtemp = averagedtemp / 3


print(averagedtemp)
var counter = 0
for row in temperatures {
for value in row {
    print(value)
    counter = counter + 1
}

}
print(counter)
var collumns = 0
let table = [
    [3, 5, 7, 9],
    [2, 4],
    [8, 6, 1,],
    [10]
    ]
    collumnTotal(table: table, column: collumns)

    }}