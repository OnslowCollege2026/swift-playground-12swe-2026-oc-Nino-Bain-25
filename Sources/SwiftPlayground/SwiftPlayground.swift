///Adds up all integers in a collumn in a 2D array. Does not include rows that do not have a value in that column.
/// Parametres:
/// Table: The 2d array of numbers we are looking at
/// column: The collumn of numbers in the table we are looking at.

func collumnTotal (table: [[Int]], column: Int) -> Int {
var counter = 0

for row in table {
if row.count >= column {
    counter = counter + row[column]
}
}





return counter
}






@main

struct SwiftPlayground {
    static func main() {
let temperatures = [
    [2, 4, 6],
    [8, 10, 12],
    [14, 16, 18]
]

print(temperatures[0])
print(temperatures[1][2])
print(temperatures[2][1])
var averagedtemp = 0
temperatures[1].forEach {temp in
averagedtemp = averagedtemp + temp

}
averagedtemp = averagedtemp / temperatures[1].count


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
    print(collumnTotal(table: table, column: collumns))

    }}