// fig05-06: Simulating the dice game craps
import Darwin

// enum representing game status constants (no raw type)
enum Status {
    case Continue, Won, Lost
}

// enum with Int constants representing common dice totals
enum DiceNames: Int {
    case SnakeEyes = 2
    case Trey = 3
    case Seven = 7
    case YoLeven = 11
    case BoxCars = 12
}

// function that rolls two dice and returns them and their sum as a tuple
func rollDice() -> (die1: Int, die2: Int, sum: Int) {
    let die1 = Int(1 + arc4random_uniform(6)) // first die roll
    let die2 = Int(1 + arc4random_uniform(6)) // second die roll
    return (die1, die2, die1 + die2)
}

// function to display a roll of the dice
func displayRoll(roll: (Int, Int, Int)) {
    println("Player rolled \(roll.0) + \(roll.1) = \(roll.2)")
}

// play one game of craps
var myPoint = 0 // point if no win or loss on first roll
var gameStatus = Status.Continue // can contain Continue, Won or Lost

var roll = rollDice() // first roll of the dice
displayRoll(roll) // display the two dice and the sum

// determine game status and point based on first roll
switch roll.sum {
    // win on first roll
    case DiceNames.Seven.toRaw(), DiceNames.YoLeven.toRaw():
        gameStatus = Status.Won
    // lose on first roll
    case DiceNames.SnakeEyes.toRaw(), DiceNames.Trey.toRaw(),
         DiceNames.BoxCars.toRaw():
        gameStatus = Status.Lost
    // did not win or lose, so remember point
    default:
        gameStatus = Status.Continue // game is not over
        myPoint = roll.sum // remember the point
        println("Point is \(myPoint)")
}

// while game is not complete
while gameStatus == Status.Continue
{
    roll = rollDice() // first roll of the dice
    displayRoll(roll) // display the two dice and the sum
    
    // determine game status
    if roll.sum == myPoint { // won by making point
        gameStatus = Status.Won
    } else {
        if (roll.sum == DiceNames.Seven.toRaw()) { // lost by rolling 7
            gameStatus = Status.Lost
        }
    }
}

// display won or lost message
if gameStatus == Status.Won {
    println("Player wins")
} else {
    println("Player loses")
}


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
