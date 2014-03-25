//
//  SMAppDelegate.m
//  SMDataDiller
//
//  Created by SM on 03.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMAppDelegate.h"
#import "SMTestTableViewController.h"       // EXAMPLE 1
#import "SMTestCollectionViewController.h"  // EXAMPLE 2

static NSUInteger const kExampleNumber = 1;

@implementation SMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[self createRootVCForTest:kExampleNumber]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIViewController *)createRootVCForTest:(int)testNumber
{
    UIViewController *result = nil;
    switch (testNumber) {
        case 1:
            result = [SMTestTableViewController new]; //example1 (tableView)
            break;
            
        case 2:
            result = [SMTestCollectionViewController new]; //example2 (collectionView)
            break;
            
        default:
            break;
    }
    return result;
}

@end
