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
        
        /**
         * Step 5-5 of Core Data exercise
         */
        Notebook *notebook = appContent.notebook;
        NSLog(@"NOTEBOOK >> name: \"%@\", description: \"%@\"", notebook.name, notebook.notebookDescription);
        
        /**
         * Step 7-3 of Core Data exercise
         */
        [notebook.notes enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
            NSLog(@"    %@: %@", [obj title], [obj noteContent]);
        }];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([EVAppDelegate class]));
    }
}
