// fig04-06: Compound interest calculations with the for...in statement
import Foundation

// format a String right aligned in a field
func rightAlignedString(string: String, fieldWidth: Int) -> String {
    let spaces: Int = fieldWidth - countElements(string)
    let padding = String(count: spaces, repeatedValue: Character(" "))
    return padding + string
}

// create and configure an NSNumberFormatter for currency values
var formatter = NSNumberFormatter()
formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle

var amount = 1000.0 // initial amount before interest
let rate = 0.05 // interest rate

// display headers
println(String(format:"%@%@", "Year",
    rightAlignedString("Amount on deposit", 20)))

// calculate amount on deposit for each of ten years
for year in 1...5 {
    // calculate new amount for specified year
    amount *= (1.0 + rate)
    
    // display the year and the amount
    println(String(format:"%4d%@", year,
        rightAlignedString(formatter.stringFromNumber(amount), 20)))
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
