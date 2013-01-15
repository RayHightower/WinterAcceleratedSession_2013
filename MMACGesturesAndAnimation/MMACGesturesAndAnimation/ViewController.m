//
//  ViewController.m
//  MMACGesturesAndAnimation
//
//  Created by Don Bora on 1/10/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
{
    IBOutlet UIView* rotatinView;
    
    SecondViewController* secondViewController;
}

-(IBAction)changeColorLeft:(id)sender;
-(IBAction)changeColorRight:(id)sender;
-(IBAction)rotate:(id)sender;
-(IBAction)showViewUp:(id)sender;
-(IBAction)showViewDown:(id)sender;
- (IBAction)changeColor:(id)sender;

@end


@implementation ViewController

-(IBAction)rotate:(id)sender
{
    CABasicAnimation* spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    spinAnimation.toValue = [NSNumber numberWithFloat:5*2*M_PI];
    [rotatinView.layer addAnimation:spinAnimation forKey:@"spinAnimation"];
}



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

- (IBAction)changeColor:(id)sender {
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
