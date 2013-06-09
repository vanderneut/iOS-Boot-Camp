//
//  DataHandler.m
//  BMI
//
//  Created by Erik van der Neut on 6/8/13.
//  Copyright (c) 2013 Matthew Campbell. All rights reserved.
//

#import "DataHandler.h"

@implementation DataHandler

-(void)logStatistic:(float)averageBMI
 withNumberOfPeople:(long)numberOfPeople
{
    NSLog(@"Study results: average BMI of %f.1 over %li people", averageBMI, numberOfPeople);
}

@end
