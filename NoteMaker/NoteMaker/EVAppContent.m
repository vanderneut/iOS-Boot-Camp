//
//  EVAppContent.m
//  NoteMaker
//
//  Created by Erik van der Neut on 6/11/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "EVAppContent.h"
#import <CoreData/CoreData.h>

@interface EVAppContent()

/**
 * Step 3-2 of Core Data excercise
 */
-(NSURL *)dataStoreURL;
@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

@end

@implementation EVAppContent
@synthesize name, contentTypes;

/**
 * Step 3-3 of Core Data excercise
 */
NSManagedObjectModel *_managedObjectModel;
NSPersistentStoreCoordinator *_persistentStoreCoordinator;
NSManagedObjectContext *_managedObjectContext;

/**
 * Step 5-3 of Core Data exercise
 */
Notebook *_notebook;

/**
 * Step 5-4 of Core Data exercise
 */
-(Notebook *)notebook
{
    if (_notebook) return _notebook;    /* RETURN existing notebook when we already have it */
    
    // Use a fetch request to see if we can retrieve a notebook from the data store:
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Notebook"
                                              inManagedObjectContext:context];
    request.entity = entity;
    NSArray *listOfNotebooks = [context executeFetchRequest:request error:nil];
    if ([listOfNotebooks count])
    {
        NSLog(@"Found notebook in data store - we'll return that");
        _notebook = [listOfNotebooks lastObject];
        return _notebook;               /* RETURN notebook from local storage */
    }
    
    // No notebook in the datastore either, so just create a new one now:
    NSLog(@"No notebook in the data store, so we need a new notebook now");
    _notebook = (Notebook *)[NSEntityDescription insertNewObjectForEntityForName:@"Notebook"
                                                          inManagedObjectContext:context];
    _notebook.name = @"New Notebook";
    _notebook.notebookDescription = @"A new notebook description";
    [context save:nil];
    
    /**
     * Step 7-2 of Core Data exercise
     */
    for (int i = 0; i < 3; i++)
    {
        Note *note = (Note *)[NSEntityDescription insertNewObjectForEntityForName:@"Note"
                                                           inManagedObjectContext:context];
        note.title = [NSString stringWithFormat:@"Note %i", i];
        note.noteContent = [NSString stringWithFormat:@"Content for note %i", i];
        [_notebook addNotesObject:note];
    }
    
    [context save:nil];
    
    return _notebook;                   /* RETURN a brand new notebook */
}

/**
 * Step 3-4 of Core Data excercise
 */
-(NSURL *) dataStoreURL
{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [NSURL fileURLWithPath:[docDir stringByAppendingPathComponent:@"DataStore.sql"]];
}

/**
 * Step 3-5 of Core Data excercise
 */
-(NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel) return _managedObjectModel;
    
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return _managedObjectModel;
}

/**
 * Step 3-6 of Core Data excercise
 */
-(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator) return _persistentStoreCoordinator;
    
    // NOTE: in next line go through getter [self managedObjectModel] instead of _managedObjectModel directly!!
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    NSError *error = nil;
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:[self dataStoreURL]
                                                         options:nil
                                                           error:&error])
    {
        NSLog(@"Unresolved Core Data error with persistentStoreCoordinator: %@, %@", error, [error userInfo]);
    }
    
    return _persistentStoreCoordinator;
}

/**
 * Step 3-7 of Core Data excercise
 */
-(NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext) return _managedObjectContext;
    
    if ([self persistentStoreCoordinator])
    {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:[self persistentStoreCoordinator]];
    }
    
    return _managedObjectContext;
}

static EVAppContent *singletonInstance = nil;

+(EVAppContent *) sharedContent
{
    @synchronized(self)
    {
        if (singletonInstance == nil)
            singletonInstance = [[self alloc] init];
        
        return singletonInstance;
    }
}

-(id)init
{
    self = [super init];
    if (self)
    {
        self.name = @"Note Maker Application Content";
        self.contentTypes = [[NSMutableArray alloc] init];
        [self.contentTypes addObject:@"NoteBook"];
        [self.contentTypes addObject:@"Note"];
    }
    
    return self;
}

-(NSString *)description
{
    NSMutableString *tempString = [[NSMutableString alloc] initWithString:self.name];
    [tempString appendString:@" supports "];
    
    [self.contentTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [tempString appendString:obj];
        [tempString appendString:@", "];
    }];
    
    return tempString;
}

/**
 * Step 3-1 of Table Views excercise
 */
-(void)insertNewNote
{
    NSManagedObjectContext *context = [self managedObjectContext];
    Note *n = (Note *)[NSEntityDescription insertNewObjectForEntityForName:@"Note"
                                                    inManagedObjectContext:context];
    n.title = @"New note";
    n.noteContent = @"Content for new note";
    [self.notebook addNotesObject:n];
}

/**
 * Step 3-2 of Table Views exercise
 */
-(void)removeThisNote:(Note *)note
{
    [[self managedObjectContext] deleteObject:note];
    [self.notebook removeNotesObject:note];
}

/**
 * Step 3-3 of Table Views exercise
 */
-(void)save
{
    NSError *error = nil;
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if ([context hasChanges]) [context save:&error];
    
    if (error) NSLog(@"WARNING: Error saving to data store. %@", error);
}

@end
