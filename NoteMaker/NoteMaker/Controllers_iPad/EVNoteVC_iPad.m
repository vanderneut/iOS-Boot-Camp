//
//  EVNoteVC_iPad.m
//  NoteMaker
//
//  Created by Erik van der Neut on 7/23/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "EVNoteVC_iPad.h"

@implementation EVNoteVC_iPad
@synthesize masterPopOverController;

/**
 * Step 2-5 of the iPad and Universal Apps exercise
 */
- (void) updateDetailView
{
    // Step 2-10 of the iPad and Universal Apps exercise:
    self.noteTextField.text = self.note.noteContent;
}

@end
