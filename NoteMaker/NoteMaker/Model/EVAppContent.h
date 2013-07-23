//
//  EVAppContent.h
//  NoteMaker
//
//  Created by Erik van der Neut on 6/11/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Notebook.h"                                    // Step 5-1 of Core Data exercise
#import "Note.h"                                        // Step 7-1 of Core Data exercise

@interface EVAppContent : NSObject

+(EVAppContent *) sharedContent;

@property (strong) NSString *name;
@property (strong) NSMutableArray *contentTypes;
@property (strong, readonly) Notebook *notebook;        // Step 5-2 of Core Data exercise

-(void)insertNewNote;                                   // Step 3-1 of Table Views exercise
-(void)removeThisNote:(Note *)note;                     // Step 3-2 of Table Views exercise
-(void)save;                                            // Step 3-3 of Table Views exercise

@end
