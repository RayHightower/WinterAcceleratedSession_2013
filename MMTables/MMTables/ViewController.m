//
//  ViewController.m
//  MMTables
//
//  Created by Don Bora on 1/14/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray* things;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    things = @[@"first", @"second", @"third", @"whatever", @"fouth", @"fifth", @"sixth"];
    NSLog(@"things = %@", things);
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
    
    tableViewCell.textLabel.text = [things objectAtIndex:indexPath.row];
    return tableViewCell;
}

@end
