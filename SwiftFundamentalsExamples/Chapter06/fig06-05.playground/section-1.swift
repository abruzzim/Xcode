// fig06-05: Array methods and operators for adding and removing elements

// display contents, size and capacity of an Array<Int>
func displayIntegers(integers: [Int]) {
    print("contents: \(integers.description)")
    println("; size=\(integers.count); capacity=\(integers.capacity)")
}

var integers = [Int]() // create an empty variable Array<Int>
println("After creating integers")
displayIntegers(integers)

if integers.isEmpty { // true if integers contains 0 elements
    println("integers is empty")
}

// append each value of i to integers
println("\nAppending values 1-5")
for i in 1...5 {
    integers.append(i)
    displayIntegers(integers)
}

// inserting elements
integers.insert(0, atIndex:0)
integers.insert(6, atIndex:integers.count)
println("\nAfter inserting 0 at index 0 and 6 at integers.count")
displayIntegers(integers)

// appending elements with +=
integers += 7
integers += [8, 9]
println("\nAfter appending 7, 8 and 9 with +=")
displayIntegers(integers)

// removing element 0 and the last element
println("\n\(integers.removeAtIndex(0)) was removed")
println("\(integers.removeLast()) was removed")
println("After removing element 0 and the last element")
displayIntegers(integers)

// removing all elements
integers.removeAll() // by default, element storage is deallocated
println("\nAfter removing all remaining elements")
displayIntegers(integers)


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
