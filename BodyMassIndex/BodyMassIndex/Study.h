//
//  Study.h
//  BodyMassIndex
//
//  Created by Erik van der Neut on 6/9/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StudyDelegate <NSObject>

@required
-(void)logStatistic:(float)averageBMI
  withAverageHeight:(float)averageHeight
  withAverageWeight:(float)averageWeight
 withNumberOfPeople:(long)numberOfPeople;
@end


@interface Study : NSObject

@property(strong)NSMutableArray *people;
@property(assign)id<StudyDelegate> delegate;

-(void)calculateAndReportStats;

@end
