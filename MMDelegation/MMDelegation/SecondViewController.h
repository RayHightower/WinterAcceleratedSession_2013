//
//  SecondViewController.h
//  MMDelegation
//
//  Created by Don Bora on 1/14/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorChangeDelegate.h"

@interface SecondViewController : UIViewController
@property(nonatomic, retain)id<ColorChangeDelegate> delegate;
@end
