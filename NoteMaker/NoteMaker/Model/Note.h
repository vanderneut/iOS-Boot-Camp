//
//  Note.h
//  NoteMaker
//
//  Created by Erik van der Neut on 7/5/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Notebook;

@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * noteContent;
@property (nonatomic, retain) Notebook *notebook;

@end
