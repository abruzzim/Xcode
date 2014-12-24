// fig05-03: Function maximum with three Double parameters.

// returns the maximum of its three Double parameters
func maximum(x: Double, y: Double, z: Double) -> Double {
    var maximumValue = x // assume x is the largest to start
    
    // determine whether y is greater than maximumValue
    if y > maximumValue {
        maximumValue = y
    }
    
    // determine whether z is greater than maximumValue
    if z > maximumValue {
        maximumValue = z
    }
    
    return maximumValue
}

// test function maximum
println("Maximum of 3.3, 2.2 and 1.1 is: \(maximum(3.3, 2.2, 1.1))")
println("Maximum of 1.1, 3.3 and 2.2 is: \(maximum(1.1, 3.3, 2.2))")
println("Maximum of 2.2, 1.1 and 3.3 is: \(maximum(2.2, 1.1, 3.3))")


/**************************************************************************
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
