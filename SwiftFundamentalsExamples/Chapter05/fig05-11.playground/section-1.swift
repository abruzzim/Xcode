// fig05-11: Recursive factorial function

// recursive factorial function
func factorial(number: Int64) -> Int64 {
    // base case
    if number <= 1 {
        return 1
    } else { // recursion step
        return number * factorial(number - 1)
    }
}

// calculate the factorials of 0 through 10
for counter in 0...10 {
    println("\(counter)! = \(factorial(Int64(counter)))")
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
