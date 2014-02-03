//
//  SMAppDelegate.m
//  SMDataDiller
//
//  Created by SM on 03.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMAppDelegate.h"
#import "SMTestTableViewController.h" // TEST1


@implementation SMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [self createRootVCForTest:1];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIViewController *)createRootVCForTest:(int)testNumber
{
    UIViewController *result = nil;
    switch (testNumber) {
        case 1:
            result = [SMTestTableViewController new]; //test1 (tableView)
            break;
            
        default:
            break;
    }
    return result;
}

@end
