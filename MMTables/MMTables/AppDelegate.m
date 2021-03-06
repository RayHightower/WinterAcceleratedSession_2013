//
//  AppDelegate.m
//  MMTables
//
//  Created by Don Bora on 1/14/13.
//  Copyright (c) 2013 Don Bora. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <CoreData/CoreData.h>

@implementation AppDelegate

@synthesize managedObjectContext = m_managedObjectContext;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self __initCoreData];

    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];

    navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    
    self.window.rootViewController = navigationController;

    // self.window.rootViewController = self.viewController;

    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(NSArray*)allEntitiesForName:(NSString*)name
{
    NSEntityDescription* entityDescription = [NSEntityDescription entityForName:name inManagedObjectContext:m_managedObjectContext];
	NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    NSFetchedResultsController* fetchedResultsController;
    NSArray* sortDescriptors = [[NSArray alloc] initWithObjects:nil];
    NSError* error;
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setEntity:entityDescription];
    fetchedResultsController = [[[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                    managedObjectContext:m_managedObjectContext
                                                                      sectionNameKeyPath:nil
                                                                               cacheName:nil] autorelease];
    [fetchedResultsController performFetch:&error];
	[fetchRequest release];
    
	return fetchedResultsController.fetchedObjects;
}



-(void)__initCoreData
{
    NSURL* documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL* modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    NSURL* sqliteURL = [documentsDirectoryURL URLByAppendingPathComponent:@"Model.sqlite"];
    NSError* error;
    
    
    m_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
      
    m_persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:m_managedObjectModel];
    
  
    if ([m_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqliteURL options:nil error:&error])
    {
        m_managedObjectContext = [[NSManagedObjectContext alloc] init];
        [m_managedObjectContext setPersistentStoreCoordinator:m_persistentStoreCoordinator];
    }
}



@end
