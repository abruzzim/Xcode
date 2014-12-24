// fig06-02: Creating and initializing Arrays

// create and display an empty Array<Int>
let integers1 = [Int]()
println("integers1: \(integers1.description)")

// create and display an Array<Bool> with all elements set to true
let booleans = [Bool](count: 5, repeatedValue: true)
println("booleans: \(booleans.description)")

// create and display an empty Array<Int> using an empty initializer list
let integers2: [Int] = [] // must specify Array's type
println("integers2: \(integers2.description)")

// type inferred as Array<Int> (i.e., [Int]) from initializer list
let integers3 = [0, 1, 2, 3, 4]
println("integers3: \(integers3.description)")

// type inferred as Array<String> (i.e., [String]) from initializer list
let strings2 =
    ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
println("strings: \(strings2.description)")

// creating a new Array by concatenating existing Arrays with +
let integers4 = integers3 + integers3
println("integers4: \(integers4.description)")

// concatenating an existing Array and an Array literal with +
let integers5 = integers3 + [5, 6, 7, 8, 9]
println("integers5: \(integers5.description)")

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
