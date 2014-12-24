//
//  FWSViewController.m
//  Matchismo
//
//  Created by abruzzim on 11/30/14.
//  Copyright (c) 2014 Framework Solutions, LLC. All rights reserved.
//

#import "FWSViewController.h"
#import "PlayingCardDeck.h"

@interface FWSViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

// Private storage within which to keep each card array pointer.
// Make space in the instance for the pointer "cards".

@property (strong, nonatomic) Deck *myDeck; // Collection of playing cards.

@end

@implementation FWSViewController

- (Deck *)myDeck
{
    // Lazy Instantiate the myDeck array. In other words,
    // move the initialization code of the instance variable
    // into the accessor method of the property. This way the
    // instance variable is instantiated when it is first used.
    
    if (!_myDeck) {
        _myDeck = [[PlayingCardDeck alloc] init];
    }
    
    return _myDeck;
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount value is: %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    
    if ([sender.currentTitle length]) {
        
        // Display the back of the card.
        
        // The sender (button) will send a message to
        // set the background image to the cardback and
        // set the button title to the empty string.
        
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@""
                forState:UIControlStateNormal];

    } else {
        
        // Display the front of the card.
        
        // Draw a random card.
        
        Card *card = [self.myDeck drawRandomCard];
        
        if (card) {
            
            // The sender (button) will send a message to
            // set the background image to the cardfront and
            // set the button title to the content of the randomCard.
            
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:card.contents
                    forState:UIControlStateNormal];
            
            // This invokes both the "getter" and "setter"
            // methods of this view controller.

            self.flipCount++;
        }
    }
}

@end
