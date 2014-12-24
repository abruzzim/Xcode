// fig05-06: Demonstrating scopes
var x = 5 // global variable x

class Scope {
    var x = 1 // property hides global variable x in class Scope
    
    // create and initialize local variable x during each call
    func useLocalVariable()
    {
        var x = 25 // initialized each time useLocalVariable is called
        
        println("\nlocal x on entering useLocalVariable is \(x)")
        ++x // modifies this method's local variable x
        println("local x before exiting useLocalVariable is \(x)")
    }
    
    // modify class Scope's property x during each call
    func useProperty() {
        println("\nproperty x on entering useProperty is \(x)")
        x *= 10 // modifies class Scope's property x
        println("property x before exiting useProperty is \(x)")
    }
}

var scope = Scope() // create a Scope object

println("global variable x when program begins execution is \(x)")

scope.useLocalVariable()
scope.useProperty()
scope.useLocalVariable()
scope.useProperty()

println("\nglobal variable x before program terminates is \(x)")


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
