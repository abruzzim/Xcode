// fig06-03: Iterating through Array elements
import Foundation // to access String formatting features

let integers = [2, 4, 6, 8, 10]
println(
    "Array integers via description property: \(integers.description)")

// for...in loop automatically returning each Array element
print("\nArray integers via for...in loop: ")
for element in integers {
    print("\(element)  ")
}

// for loop explicitly specifying how to count
println("\n\nArray integers selected elements ")
println("in column format via counter-controlled for loop")
println("Index  Value")
for var index = 0; index < integers.count; index += 2 {
    println(String(format:"%5d%7d", index, integers[index]))
}

// for...in loop with range of indices
println("\nArray integers in column format via for...in loop with range")
println("Index  Value")
for index in 0..<integers.count {
    println(String(format:"%5d%7d", index, integers[index]))
}

// for...in loop with enumerate global function
println(
    "\nArray integers in column format via for...in loop with enumerate")
println("Index  Value")
for (index, element) in enumerate(integers) {
    println(String(format:"%5d%7d", index, element))
}

/*************************************************************************
* (C) Copyright 1992-2015 by Deitel & Associates, Inc. and               *
* Pearson Education, Inc. All Rights Reserved.                           *
*                                                                        *
* DISCLAIMER: The authors and publisher of this book have used their     *
* best efforts in preparing the book. These efforts include the          *
* development, research, and testing of the theories and programs        *
* to determine their effectiveness. The authors and publisher make       *
* no warranty of any kind, expressed or implied, with regard to these    *
* programs or to the documentation contained in these books. The authors *
* and publisher shall not be liable in any event for incidental or       *
* consequential damages in connection with, or arising out of, the       *
* furnishing, performance, or use of these programs.                     *
*************************************************************************/
