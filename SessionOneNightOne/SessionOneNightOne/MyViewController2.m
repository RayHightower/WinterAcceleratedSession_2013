//
//  MyViewController.m
//  SessionOneNightOne
//
//  Created by Don Bora on 1/7/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "MyViewController2.h"

@interface MyViewController2 ()
{
    IBOutlet UILabel* theLabel;
    NSString* textValue;
}
-(IBAction)close:(id)sender;
@end

@implementation MyViewController2

@synthesize labelText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(IBAction)close:(id)sender
{
    [self.view removeFromSuperview];
}

-(void)setTheText:(NSString*)value
{
    textValue = value;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    theLabel.text = textValue;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
