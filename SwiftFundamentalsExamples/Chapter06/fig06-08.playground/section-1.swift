// fig06-08: Demonstrating Array methods filter, map and reduce

// Array of Ints to filter, map and reduce
let values = [3, 10, 6, 1, 4, 8, 2, 5, 9, 7]

println("values: \(values.description)")

// filter: even values displayed in sorted order
let evenValues = values.filter({$0 % 2 == 0}).sorted(<)
println("Even values sorted: \(evenValues.description)")

// map: square each value 
let squaresOfValues = values.map({$0 * $0}).sorted(<)
println("Squares of values sorted: \(squaresOfValues.description)")

// reduce: sum the elements of values
let sumOfValues = values.reduce(0, {$0 + $1})
println("Sum of values: \(sumOfValues)")

// filter, map and reduce: sum the squares of the even integers
let sumOfSquares =
    values.filter({$0 % 2 == 0})
          .map({$0 * $0})
          .reduce(0, {$0 + $1})
println("Sum of the even value squares: \(sumOfSquares)")


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
