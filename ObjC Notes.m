// Person.h

@interface Person : NSObject

// Property list

@property NSString *fName;
@property NSString *lName;

// Method declarations

- (void)dspFname;
- (NSString *)fullName;
- (NSString *)speak:(NSString *)phrase;
- (void)dspAge:(NSNumber *)age;

@end

// Person.m

#import "Person.h"

@implementation Person

- (void)dspFname;
{
  NSLog(@"First name is %@", self.fName);
}

- (NSString *)fullName;
{
  NSString *message = [NSString stringWithFormat:@"%@ %@", self.fName, self.lName];
  return message;
}

- (NSString *)speak:(NSString *)phrase;
{
  NSString *sentence = [NSString stringWithFormat:@"%@ say: %@.", self.fName, phrase];
  return sentence
}

- (void)dspAge:(NSNumber *)age;
{
  NSLog(@"%@ is %@ years old", self.fName, age);
}

@end

// Use the methods

Person *me = [[Person alloc] init];
me.fName = @"Mario";
me.lName = @"Abruzzi"
me.dspFname;
// Prints "First name is Mario"
NSString *myFullName = me.fullName;
NSLog (@"My full name is %@", myFullName);
// Prints "My full name is Mario Abruzzi"
NSString *aSentence = [me speak:@"Shutup turds"];
NSLog (@"%@", aSentence);
// Prints "Mario says: Shutup turds."
[me dspAge:@49];
// Prints "Mario is 49 years old".