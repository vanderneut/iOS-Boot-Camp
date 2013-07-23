//
//  EVNoteVC.m
//  NoteMaker
//
//  Created by Erik van der Neut on 7/12/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "EVNoteVC.h"

@interface EVNoteVC ()

@end

@implementation EVNoteVC

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

    self.title = [self.note title];
    self.noteTextField.text = [self.note noteContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
