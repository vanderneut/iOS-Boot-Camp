//
//  Study.h
//  BodyMassIndex
//
//  Created by Erik van der Neut on 6/9/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Study : NSObject

@property NSMutableArray *people;

-(void)calculateAndReportStats;

@end
