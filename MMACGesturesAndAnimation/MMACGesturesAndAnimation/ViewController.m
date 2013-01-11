//
//  ViewController.m
//  MMACGesturesAndAnimation
//
//  Created by Don Bora on 1/10/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

-(IBAction)changeColorLeft:(id)sender;
-(IBAction)changeColorRight:(id)sender;

@end

@implementation ViewController

-(IBAction)changeColorRight:(id)sender
{
    self.view.backgroundColor = [UIColor purpleColor];
}

-(IBAction)changeColorLeft:(id)sender
{
    self.view.backgroundColor = [UIColor blackColor];
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
