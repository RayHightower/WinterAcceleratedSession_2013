//
//  Person.h
//  MMTables
//
//  Created by Don Bora on 1/17/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * photo;

@end
