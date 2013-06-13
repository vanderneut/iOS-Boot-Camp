//
//  EVAppDelegate.m
//  NoteMaker
//
//  Created by Erik van der Neut on 6/11/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "EVAppDelegate.h"

@implementation EVAppDelegate

@synthesize window = _window;       // <-- What does that do..?

UILabel *myLabel;
UIButton *myButton;

/******* comment out the 003-001 exercise code: ************
- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    myLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 40)];
    myLabel.text = @"Click button to see application name";
    [self.window addSubview:myLabel];
    
    myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myButton.frame = CGRectMake(110, 200, 100, 50);
    [self.window addSubview:myButton];
    
    [myButton addTarget:self
                 action:@selector(onMyButtonClick)
       forControlEvents:UIControlEventTouchUpInside];
}

- (void)onMyButtonClick
{
    // Get pointer to the Singleton that holds the data:
    EVAppContent *content = [EVAppContent sharedContent];
    myLabel.text = content.name;
}
************************************************************/

/******* comment out the auto-injected code: ***********
 
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
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
************************************************************/

@end
