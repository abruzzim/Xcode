// fig06-14: Creating two-dimensional Arrays

// display two-dimensional Arrays of Ints by row
func outputArray(values: [[Int]]) { // Array<Array<Int>>
    for row in values {
        for column in row {
           print("\(column)  ")
        }
        
        println()
    }
}

// display two-dimensional Arrays of Ints by row using indices
func outputArrayWithIndices(values: [[Int]]) { // Array<Array<Int>>
    for row in 0 ..< values.count {
        for column in 0 ..< values[row].count {
            print("\(values[row][column])  ")
        }
        
        println()
    }
}

let array1 = [[1, 2, 3], [4, 5, 6]]
println("Values in array1 by row")
outputArray(array1)
println("\nValues in array1 by row using indices")
outputArrayWithIndices(array1)

let array2 = [[1, 2], [3], [4, 5, 6]]
println("\nValues in array2 by row")
outputArray(array2)
println("\nValues in array2 by row using indices")
outputArrayWithIndices(array2)

var array3: [[Int]] = Array(count: 3, repeatedValue: [])
array3[0] = [1, 2, 3]
array3[1] = [4, 5]
array3[2] = [6]
println("\nValues in array3 by row")
outputArray(array3)
println("\nValues in array3 by row using indices")
outputArrayWithIndices(array3)

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
