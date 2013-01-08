//
//  ViewController.m
//  SessionOneNightOne
//
//  Created by Don Bora on 1/7/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController2.h"

@interface ViewController ()
{
    IBOutlet UILabel* myLabel;
    IBOutlet UITextField * myTextField;
    MyViewController2* myViewController;
}
-(IBAction)pushed:(id)sender;
-(IBAction)show:(id)sender;
@end

@implementation ViewController

-(IBAction)show:(id)sender
{
    myViewController = [[MyViewController2 alloc] initWithNibName:nil bundle:nil];
    
//    myViewController.labelText = myTextField.text;
    [myViewController setTheText:myTextField.text];
    [self.view addSubview:myViewController.view];
}

-(IBAction)pushed:(id)sender
{
    myLabel.text = myTextField.text;
    [myLabel setText:[myTextField text]];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    myLabel.text = @"My Label!";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}
@end
