//
//  Study.h
//  BMI
//
//  Created by Matthew Campbell on 8/23/12.
//  Copyright (c) 2012 Matthew Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Study : NSObject

@property(strong)NSMutableArray *people;

-(void)calculateStatistics;

@end