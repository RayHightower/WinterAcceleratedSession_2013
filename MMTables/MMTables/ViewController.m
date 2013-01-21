//
//  ViewController.m
//  MMTables
//
//  Created by Don Bora on 1/14/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "EditViewController.h"

@interface ViewController ()
{
    NSArray* things;
    NSMutableArray* people;
    IBOutlet UITableView* myTableView;
    EditViewController* editViewController;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    

    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"apiDataLoaded"]) {
        NSURLRequest* urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobilemakers.co/api/members.json"]];
        
        [NSURLConnection sendAsynchronousRequest:urlRequest
                                           queue:[NSOperationQueue currentQueue]
                               completionHandler:
         ^(NSURLResponse* response, NSData* data, NSError* error)
         {
             NSManagedObjectContext* context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).managedObjectContext;
             Person* person;
             NSError* sqlError;
             
             things = (NSArray*)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
             [things retain];
             
             people = [NSMutableArray arrayWithCapacity:[things count]];
             [people retain];
             
             for (NSDictionary* dict in things) {
                 person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
                 
                 person.name = [dict valueForKey:@"name"];
                 person.email = [dict valueForKey:@"email"];
                 [people addObject:person];
                 
                 if (![context save:&sqlError]) {
                     NSLog(@"Failed!");
                 }
             }
             
             
             [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"apiDataLoaded"];
             [myTableView reloadData];
         }];
    }
    else
    {
        people = [[((AppDelegate*)[[UIApplication sharedApplication] delegate]) allEntitiesForName:@"Person"] mutableCopy];
        [people retain];
    }
    
    
    /*//things = @[@"first", @"second", @"third", @"whatever", @"fouth", @"fifth", @"sixth"];
    things = [NSArray arrayWithObjects:@"first", @"second", @"third", @"whatever", @"fouth", @"fifth", @"sixth", nil];
    [things retain];
    NSLog(@"things = %@", things);
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark PersistantDelegate

-(void)didSave
{
    [myTableView reloadData];
}

#pragma mark UITableViewDelegate


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    editViewController = [[EditViewController alloc] initWithNibName:nil bundle:nil];
    editViewController.person = (Person*)[people objectAtIndex:indexPath.row];
    editViewController.delegate = self;
    
    [self.view addSubview:editViewController.view];
    NSLog(@"%@", [things objectAtIndex:indexPath.row]);
}

#pragma mark UITableViewDataSouce

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
   return 1;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* tableViewCell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"MMTableViewReuseIdentifier"];
    
    if (tableViewCell == nil) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MMTableViewReuseIdentifier"];
    }
    else{
        NSLog(@"we are resuing!!!!");
    }
    
    
    tableViewCell.textLabel.text = [[people objectAtIndex:indexPath.row] name];
    return tableViewCell;
}

@end
