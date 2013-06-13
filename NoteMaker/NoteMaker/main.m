//
//  main.m
//  NoteMaker
//
//  Created by Erik van der Neut on 6/11/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EVAppContent.h"
#import "EVAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool
    {
        EVAppContent *appContent = [[EVAppContent alloc] init];
        NSLog(@"App content: %@", appContent);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([EVAppDelegate class]));
    }
}
