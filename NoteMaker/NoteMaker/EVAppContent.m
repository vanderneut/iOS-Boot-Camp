//
//  EVAppContent.m
//  NoteMaker
//
//  Created by Erik van der Neut on 6/11/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "EVAppContent.h"

@implementation EVAppContent
@synthesize name, contentTypes;

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

@end
