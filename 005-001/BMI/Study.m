//
//  Study.m
//  BMI
//
//  Created by Matthew Campbell on 8/23/12.
//  Copyright (c) 2012 Matthew Campbell. All rights reserved.
//

#import "Study.h"
#import "BMI.h"

@implementation Study

-(void)calculateStatistics
{
    float totalBMI = 0.0;
    long numberOfPeople = [self.people count];
    
    for (Person *p in self.people)
        totalBMI += [p.bmi.measurement floatValue];

    float averageBMI = totalBMI / numberOfPeople;
    
    [self.delegate logStatistic:averageBMI
             withNumberOfPeople:numberOfPeople];
}

-(void)dealloc
{
    self.delegate = nil;
}

@end