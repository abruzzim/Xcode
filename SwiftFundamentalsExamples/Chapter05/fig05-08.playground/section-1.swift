// fig05-08: External parameter names

// use iteration to calculate power of base raised to the exponent
func power(#base: Int, #exponent: Int) -> Int {
    var result = 1;
    
    for i in 1...exponent {
        result *= base
    }
    
    return result
}

// call power with and without default parameter values
println("power(base: 10, exponent: 2) = \(power(base: 10, exponent: 2))")
println("power(base: 2, exponent: 10) = \(power(base: 2, exponent: 10))")


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
