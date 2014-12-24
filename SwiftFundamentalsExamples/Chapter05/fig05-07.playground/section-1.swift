// fig05-07: Overloaded function definitions

// square function with Int argument
func square(value: Int) -> Int
{
    println("Called square with Int argument: \(value)")
    return value * value
}

// square function with Double argument
func square(value: Double) -> Double
{
    println("Called square with Double argument: \(value)")
    return value * value
}

// test overloaded square functions
println("Square of Int 7 is \(square(7))\n")
println("Square of Double 7.5 is \(square(7.5))")


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
