//
//  AppDelegate.h
//  MMTables
//
//  Created by Don Bora on 1/14/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSManagedObjectModel*   m_managedObjectModel;
    NSPersistentStoreCoordinator* m_persistentStoreCoordinator;
    NSManagedObjectContext* m_managedObjectContext;
    
    
}
@property (readonly)NSManagedObjectContext* managedObjectContext;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;

-(NSArray*)allEntitiesForName:(NSString*)name;

@end
