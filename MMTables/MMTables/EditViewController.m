//
//  EditViewController.m
//  MMTables
//
//  Created by Don Bora on 1/17/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "EditViewController.h"
#import "AppDelegate.h"

@interface EditViewController ()
{
    IBOutlet UITextField *emailTextField;
    IBOutlet UITextField *nameTextField;
}
@end

@implementation EditViewController

@synthesize person;
@synthesize delegate;

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
    nameTextField.text = self.person.name;
    emailTextField.text = self.person.email;
}

- (IBAction)save:(id)sender
{
    NSManagedObjectContext* context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).managedObjectContext;
    NSError* sqlError;

    self.person.name = nameTextField.text;
    self.person.email = emailTextField.text;
    
    if (![context save:&sqlError]) {
        NSLog(@"Failed!");
    }
    
    [self.delegate didSave];
    [self.view removeFromSuperview];
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
