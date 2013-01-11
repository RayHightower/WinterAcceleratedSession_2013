//
//  ViewController.m
//  MMACGesturesAndAnimation
//
//  Created by Don Bora on 1/10/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    SecondViewController* secondViewController;
}

-(IBAction)changeColorLeft:(id)sender;
-(IBAction)changeColorRight:(id)sender;
-(IBAction)showViewUp:(id)sender;
-(IBAction)showViewDown:(id)sender;

@end


@implementation ViewController


-(IBAction)showViewUp:(id)sender
{
    [UIView animateWithDuration:1.0f animations:^(){
        secondViewController.view.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
    }];
}

-(IBAction)showViewDown:(id)sender;
{
    [UIView animateWithDuration:1.0f animations:^(){
        secondViewController.view.center = CGPointMake(self.view.center.x, self.view.center.y + 100);
    }];
}

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
    secondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    
    [self.view addSubview:secondViewController.view];
    secondViewController.view.center = CGPointMake(self.view.center.x, self.view.center.y + 300);
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
