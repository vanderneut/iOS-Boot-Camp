//
//  EVNotebookDetailsVC.h
//  NoteMaker
//  Notebook view controller
//
//  Created by Erik van der Neut on 7/8/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EVAppContent.h"    // Step 5-1 of ViewControllers exercise

@interface EVNotebookDetailsVC : UIViewController <UITextFieldDelegate>

/**
 * Part 4 of the ViewControllers exercise
 */
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UITextField *myNotebookNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *myNotebookDescriptionTextField;
- (IBAction)clearButtonAction:(id)sender;
- (IBAction)refreshButtonAction:(id)sender;

/**
 * Step 5-2 of ViewControllers exercise
 */
@property (weak, nonatomic) EVAppContent *appContent;

@end
