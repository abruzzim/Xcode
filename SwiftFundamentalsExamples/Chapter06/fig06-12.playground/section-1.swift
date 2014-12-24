// fig06-12: Passing entire Arrays and individual
// Array elements by value and by reference

// multiply all elements by 2--original Array not modified
func doesNotModifyArray(var values: [Int]) {
    for i in 0 ..< values.count {
        values[i] *= 2
    }
}

// multiply individual element by 2--original Array not modified
func doesNotModifyElement(var element: Int) {
    element *= 2
}

// multiply all elements by 2--original Array modified
func modifyArray(inout values: [Int]) {
    for i in 0 ..< values.count {
        values[i] *= 2
    }
}

// multiply individual element by 2--original Array modified
func modifyElement(inout element: Int) {
    element *= 2
}

var integers = [1, 2, 3, 4, 5]

// pass entire Array by value
println("integers before doesNotModifyArray: \(integers.description)")
doesNotModifyArray(integers)
println("integers after doesNotModifyArray: \(integers.description)")

// pass one Array element by value
println("\nintegers[3] before doesNotModifyElement: \(integers[3])")
doesNotModifyElement(integers[3])
println("integers[3] after doesNotModifyElement: \(integers[3])")

// pass entire Array by reference
println("\nintegers before modifyArray: \(integers.description)")
modifyArray(&integers) // & indicates pass by reference
println("integers after modifyArray: \(integers.description)")

// pass one Array element by value
println("\nintegers[3] before modifyElement: \(integers[3])")
modifyElement(&integers[3]) // & indicates pass by reference
println("integers[3] after modifyElement: \(integers[3])")


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
