//
//  ViewController.m
//  MMACBlocks
//
//  Created by Don Bora on 1/10/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    IBOutlet UITextField* textFieldOne;
    IBOutlet UITextField* textFieldTwo;
    IBOutlet UILabel* myLabel;
    
}
-(IBAction)addNumbers:(id)sender;
@end

@implementation ViewController


-(IBAction)addNumbers:(id)sender
{
    int tmpInt = textFieldOne.text.intValue + textFieldTwo.text.intValue;

    myLabel.text = [NSString stringWithFormat:@"%i", tmpInt];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
