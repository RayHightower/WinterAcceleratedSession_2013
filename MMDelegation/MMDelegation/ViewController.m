//
//  ViewController.m
//  MMDelegation
//
//  Created by Don Bora on 1/14/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    SecondViewController* secondViewController;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    secondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    
    [self.view addSubview:secondViewController.view];
    secondViewController.view.center = CGPointMake(secondViewController.view.center.x + 100, secondViewController.view.center.y);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
