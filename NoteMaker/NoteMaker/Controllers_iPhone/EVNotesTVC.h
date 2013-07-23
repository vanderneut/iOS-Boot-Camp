//
//  EVNotesTVC.h
//  NoteMaker
//  Notes table view controller
//
//  Created by Erik van der Neut on 7/8/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVAppContent.h"

@interface EVNotesTVC : UITableViewController

@property (weak, nonatomic) EVAppContent *appContent;       // Step 1-2 of Table Views exercise

@end
