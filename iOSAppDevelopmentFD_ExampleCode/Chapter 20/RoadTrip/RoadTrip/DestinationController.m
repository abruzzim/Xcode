//
//  DestinationController.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/9/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "DestinationController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DestinationController ()
@property (strong, nonatomic) NSArray *destinationsArray;
@property (nonatomic, readwrite) NSUInteger selectedDestination;
@end

@implementation DestinationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.destinationTableView.delegate = self;
    self.destinationTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self.delegate destinationController:self didFinishWithSave:NO];
}

- (NSInteger)numberOfSectionsInTableView:
(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    NSString *filePath = [[NSBundle mainBundle]
                          pathForResource:@"Destinations" ofType:@"plist"];
    NSDictionary *destinations = [NSDictionary dictionaryWithContentsOfFile: filePath];
    self.destinationsArray = destinations[@"DestinationData"];
    return [self.destinationsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"DestinationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary * destinationData = self.destinationsArray[indexPath.row];
    
    NSAttributedString *attributedString = [[NSAttributedString alloc]
                                            initWithString:destinationData[@"DestinationName"]
                                            
                                            attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:17.0f],
                                                          NSForegroundColorAttributeName:  [UIColor blackColor]}];
    NSLog (@" %@ %@", cell.backgroundColor, cell.backgroundView);
    
    cell.textLabel.attributedText = attributedString;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath: indexPath animated:YES];
    self.selectedDestination = indexPath.row;
    [self.delegate destinationController:self didFinishWithSave:YES];
}

@end
