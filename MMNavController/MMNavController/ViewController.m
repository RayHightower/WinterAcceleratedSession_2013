//
//  ViewController.m
//  MMNavController
//
//  Created by Don Bora on 1/19/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
- (IBAction)showSecondViewController:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"1st ViewController";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSecondViewController:(id)sender
{
    SecondViewController* secondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    
    [self.navigationController pushViewController:secondViewController animated:YES];
    
    [secondViewController release];     // Good habit. Why?? So it doesn't hang around in memory.
    
}

@end
