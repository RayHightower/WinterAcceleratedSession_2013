//
//  EditViewController.m
//  MMTables
//
//  Created by Don Bora on 1/17/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
{
    IBOutlet UITextField *emailTextField;
    IBOutlet UITextField *nameTextField;
}
@end

@implementation EditViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)save:(id)sender
{
    //save
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [nameTextField release];
    [emailTextField release];
    [super dealloc];
}
@end
