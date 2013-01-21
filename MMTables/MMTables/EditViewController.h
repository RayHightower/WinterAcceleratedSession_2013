//
//  EditViewController.h
//  MMTables
//
//  Created by Don Bora on 1/17/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "PersistantDelegate.h"

@interface EditViewController : UIViewController
@property(retain, nonatomic)Person* person;
@property(retain, nonatomic)id<PersistantDelegate>delegate;
@end
