//
//  Study.h
//  BMI
//
//  Created by Matthew Campbell on 8/23/12.
//  Copyright (c) 2012 Matthew Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@protocol StudyDelegate <NSObject>

@required
-(void)logStatistic:(float)averageBMI
 withNumberOfPeople:(long)numberOfPeople;

@end

@interface Study : NSObject

@property(strong)NSMutableArray *people;
@property(assign)id<StudyDelegate> delegate;

-(void)calculateStatistics;

@end

