//
//  EVNoteVC_iPad.h
//  NoteMaker
//
//  Created by Erik van der Neut on 7/23/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Controllers_iPhone/EVNoteVC.h"

@interface EVNoteVC_iPad : EVNoteVC

/**
 * Step 2-3 of the iPad and Universal Apps exercise
 */
@property (strong, nonatomic) UIPopoverController *masterPopOverController;

/**
 * Step 2-4 of the iPad and Universal Apps exercise
 */
- (void) updateDetailView;

@end
