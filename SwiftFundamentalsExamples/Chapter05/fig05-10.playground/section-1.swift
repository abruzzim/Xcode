// fig05-10: Pass-by-reference with inout parameters

// square function that modifies its argument in the caller
func square(inout value: Int) {
   value *= value // squares value of caller's variable
}

// test inout parameter
var x = 5
println("Original value of x is \(x)")
square(&x)
println("Value of x after calling square(&x) is \(x)")


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
