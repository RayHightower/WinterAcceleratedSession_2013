//
//  ViewController.m
//  MMACBlocks
//
//  Created by Don Bora on 1/10/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "ViewController.h"

//NSInteger (^add)(NSInteger, NSInteger) = ^(NSInteger intOne, NSInteger intTwo)
//{
//    return intOne + intTwo;
//};


@interface ViewController ()
{
    IBOutlet UITextField* textFieldOne;
    IBOutlet UITextField* textFieldTwo;
    IBOutlet UILabel* myLabel;
    
}
-(IBAction)addNumbers:(id)sender;
@end



typedef NSInteger (^addType)(NSInteger, NSInteger);

@implementation ViewController

-(IBAction)addNumbers:(id)sender
{
    //int tmpInt = add(textFieldOne.text.intValue, textFieldTwo.text.intValue);

    [self addTheNumbers:textFieldOne.text.intValue andNumber:textFieldTwo.text.intValue usingBlock:^(NSInteger intOne, NSInteger intTwo)
    {
        return intOne + intTwo;
    }];
    //myLabel.text = [NSString stringWithFormat:@"%i", tmpInt];
}

-(void)addTheNumbers:(NSInteger)intOne andNumber:(NSInteger)intTwo usingBlock:(addType)addBlock
{
    myLabel.text = [NSString stringWithFormat:@"%i", addBlock(intOne, intTwo)];
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
