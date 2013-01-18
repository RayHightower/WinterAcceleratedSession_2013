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

@interface ViewController ()
{
    NSArray* things;
    IBOutlet UITableView* myTableView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    //[super viewDidLoad];
    
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobilemakers.co/api/members.json"]];
    
    [super viewDidLoad];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:[NSOperationQueue currentQueue]
                           completionHandler:
     ^(NSURLResponse* response, NSData* data, NSError* error)
     {
         Person* person;
         NSError* sqlError;
         NSManagedObjectContext* context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).managedObjectContext;
         
         things = (NSArray*)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
         [things retain];
         
         
         for (NSDictionary* dict in things) {
             person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
             
             person.name = [dict valueForKey:@"name"];
             person.email = [dict valueForKey:@"email"];
             
             if (![context save:&sqlError]) {
                 NSLog(@"Failed!");
             }
         }
         
         
         
         [myTableView reloadData];
     }];
    NSLog(@"things = %@", things);

    
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

#pragma mark UITableViewDataSouce

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
   return 1;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [things count];
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
    
    
    tableViewCell.textLabel.text = [((NSDictionary*)[things objectAtIndex:indexPath.row]) valueForKey:@"name"];
    return tableViewCell;
}

@end
