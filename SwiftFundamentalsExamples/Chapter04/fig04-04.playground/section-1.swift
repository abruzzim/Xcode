var x = 0
var y: Int = 0

println("Example: while loop")
while x > 1 {
    println("\(x)")
    x += 1
}

println("\nExample: do - while loop")
do {
    println("\(y)")
    y += 1
} while y > 1

println("\nExample: for <var> in <collection>")
for z in 1...3 {
    print("\(z) ")
}

println("\nExample: for <_> in <collection>")
for _ in 1...3 {
    print("* ")
}

println("\nExample: for <var> in 1/2 open <collection>")
for z in 1..<3 {
    print("\(z) ")
}

println("\nExample: for <var> in stride")
for z in stride(from: 11, through: 1, by: -2) {
    print("\(z) ")
}

println("\nExample: for <var> in stride")
for z in stride(from: 11, to: 1, by: -2) {
    print("\(z) ")
}

