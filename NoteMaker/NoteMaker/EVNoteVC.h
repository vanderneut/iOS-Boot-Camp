//
//  EVNoteVC.h
//  NoteMaker
//
//  Created by Erik van der Neut on 7/12/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface EVNoteVC : UIViewController

/**
 * Step 6-1 of Table Views exercise
 */
@property (weak, nonatomic) IBOutlet UITextView *noteTextField;
@property (weak, nonatomic) Note *note;

@end
