//
//  DataHandler.m
//  BodyMassIndex
//
//  Created by Erik van der Neut on 6/11/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "Conversions.h"
#import "DataHandler.h"
#import "BMI.h"

@implementation DataHandler

-(void)logStatistic:(float)averageBMI
  withAverageHeight:(float)averageHeight
  withAverageWeight:(float)averageWeight
 withNumberOfPeople:(long)numberOfPeople
{
    // Write the report for this person:
    NSLog(@"Aggregate study results:");
    NSLog(@"- Number of people  : %ld", numberOfPeople);
    NSLog(@"- Average height    : %@", [Conversions getFeetAndInches:averageHeight]);
    NSLog(@"- Average weight    : %.0f lbs", averageWeight);
    NSLog(@"- Average BMI       : %.1f", averageBMI);
    NSLog(@"- Average BMI Level : %@\n\n", [BMI getBMILevel:[[NSNumber alloc] initWithFloat:averageBMI]]);
}

@end
