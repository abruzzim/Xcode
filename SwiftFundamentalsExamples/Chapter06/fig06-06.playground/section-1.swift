// fig06-06: Selecting and assigning to sub-Arrays
var integers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
println("integers: \(integers.description)")

// selecting the elements at indices 3...7 in integers
var subset = integers[3...7]
println("subset of integers: \(subset.description)")

// replacing the elements at indices 5...9
integers[5...9] = [50, 60, 70]
println("integers after replacing elements: \(integers.description)")

// removing the elements at indices 5...7
integers[5...7] = []
println("integers after removing elements 5-7: \(integers.description)")

// removing the elements at indices 0..<2 (i.e., 0 and 1)
integers[0..<2] = []
println("integers after removing elements 0-1: \(integers.description)")

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
