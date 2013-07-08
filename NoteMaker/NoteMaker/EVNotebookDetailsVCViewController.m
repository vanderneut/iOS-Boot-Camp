//
//  EVNotebookDetailsVCViewController.m
//  NoteMaker
//
//  Created by Erik van der Neut on 7/8/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "EVNotebookDetailsVCViewController.h"

@interface EVNotebookDetailsVCViewController ()

@end

@implementation EVNotebookDetailsVCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.appContent = [EVAppContent sharedContent];     // Step 5-3 of ViewControllers exercise
    
    /**
     * Step 6-2 of ViewControllers exercise
     */
    self.myLabel.text = self.appContent.notebook.name;
    self.myNotebookNameTextField.text = self.appContent.notebook.name;
    self.myNotebookDescriptionTextField.text = self.appContent.notebook.notebookDescription;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearButtonAction:(id)sender
{
    /**
     * Step 7-1 of ViewControllers exercise
     */
    self.myLabel.text = nil;
    self.myNotebookNameTextField.text = nil;
    self.myNotebookDescriptionTextField.text = nil;
}

- (IBAction)refreshButtonAction:(id)sender
{
    /**
     * Step 7-3 of ViewControllers exercise
     */
    self.myLabel.text = self.appContent.notebook.name;
    self.myNotebookNameTextField.text = self.appContent.notebook.name;
    self.myNotebookDescriptionTextField.text = self.appContent.notebook.notebookDescription;
}

/**
 * Step 8-2 of ViewControllers exercise
 *
 * This method makes sure that the keyboard is being dismissed upon Return
 */
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

/**
 * Step 8-3 of ViewControllers exercise
 *
 * This method takes the text that was input and either assigns it to the 
 * notebook name or the notebook description, depending on which text field
 * exactly was being used.
 */
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 0)
        self.appContent.notebook.name = textField.text;
    else
        self.appContent.notebook.notebookDescription = textField.text;
}

@end
