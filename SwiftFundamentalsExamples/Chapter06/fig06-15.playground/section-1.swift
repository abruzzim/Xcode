// fig06-15: Variadic parameters
import Foundation // for String formatting

// calculate average
func average(numbers: Double...) -> Double {
    var total = numbers.reduce(0.0, {$0 + $1})
    return total / Double(numbers.count)
}

var d1 = 10.0
var d2 = 15.0
var d3 = 20.0
var d4 = 30.0

println(String(format:"d1=%.2f\nd1=%.2f\nd1=%.2f\nd1=%.2f\n",
    d1, d2, d3, d4))
println(String(format:"Average of d1 and d2 is %.2f",
    average(d1, d2)))
println(String(format:"Average of d1, d2 and d3 is %.2f",
    average(d1, d2, d3)))
println(String(format:"Average of d1, d2, d3 and d4 is %.2f",
    average(d1, d2, d3, d4)))


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
