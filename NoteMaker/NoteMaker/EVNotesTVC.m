//
//  EVNotesTVC.m
//  NoteMaker
//  Notes table view controller
//
//  Created by Erik van der Neut on 7/8/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "EVNotesTVC.h"

@implementation EVNotesTVC

-(void)viewDidLoad
{
    /**
     * Step 1-2 of Table Views exercise
     */
    [super viewDidLoad];
    self.appContent = [EVAppContent sharedContent];
    
    /**
     * Step 4-1 of Table Views exercise
     * Add an Edit button on the left in the top bar of the view, and
     * add a + button on the right in the top bar of the view.
     */
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(insertNewNote:)];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = addButton;
}

/**
 * Step 1-3 of Table Views exercise
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.appContent.notebook.notes count];
}

/**
 * Step 1-4 of Table Views exercise
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Note *n = [[self.appContent.notebook.notes allObjects] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = n.title;
    cell.detailTextLabel.text = n.noteContent;
    
    return cell;
}

/**
 * Step 4-2 of Table Views exercise
 */
-(void)insertNewNote:(id)sender
{
    int numRows = [self.appContent.notebook.notes count];
    [self.appContent insertNewNote];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:numRows inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

/**
 * Step 4-3 of Table Views exercise
 */
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
                                           forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        Note *note = [[self.appContent.notebook.notes allObjects] objectAtIndex:indexPath.row];
        [self.appContent removeThisNote:note];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
