// fig05-12: Mechanical example of a nested function

// return a function that determines the ordering of two Ints
func sortOrder(#increasingOrder: Bool) -> (Int, Int) -> Bool {
    // return true if x and y are in ascending order
    func ascending(x: Int, y: Int) -> Bool {
        return x < y
    }

    // return true if x and y are in descending order
    func descending(x: Int, y: Int) -> Bool {
        return x > y
    }
    
    return (increasingOrder ? ascending : descending)
}

// get function for comparing Ints to see if they're in ascending order
var order = sortOrder(increasingOrder: true)

if order(7, 5) {
    println("7 and 5 are in ascending order")
} else {
    println("7 and 5 are not in ascending order")
}

// get function for comparing Ints to see if they're in descending order
order = sortOrder(increasingOrder: false)

if order(7, 5) {
    println("7 and 5 are in descending order")
} else {
    println("7 and 5 are not in descending order")
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
