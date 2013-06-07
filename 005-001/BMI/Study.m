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

-(void)calculateStatistics{
    float averageBMI = 0;
    long numberOfPeople = [self.people count];
    
    for(Person *p in self.people)
        averageBMI = averageBMI + [p.bmi.measurement floatValue];
    averageBMI = averageBMI / numberOfPeople;
    
}

@end