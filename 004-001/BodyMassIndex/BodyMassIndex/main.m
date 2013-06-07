//
//  main.m
//  BodyMassIndex
//
//  Created by Erik van der Neut on 5/28/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Conversions.h"
#import "BodyMetrics.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // Set up the data:
        NSArray *cases = [NSMutableArray arrayWithObjects:
                          [[BodyMetrics alloc] initMetricsForPerson:"Tom" withWeightInLbs:260.0 withHeightInInches:73.0],
                          [[BodyMetrics alloc] initMetricsForPerson:"Jane" withWeightInLbs:289.0 withHeightInInches:71.0],
                          [[BodyMetrics alloc] initMetricsForPerson:"Jim" withWeightInLbs:90.0 withHeightInInches:61.0],
                          [[BodyMetrics alloc] initMetricsForPerson:"Tori" withWeightInLbs:105.0 withHeightInInches:59.0],
                          [[BodyMetrics alloc] initMetricsForPerson:"Erik" withWeightInLbs:134.0 withHeightInInches:67.0],
                          [[BodyMetrics alloc] initMetricsForPerson:"Lorah" withWeightInLbs:110.0 withHeightInInches:62.0],
                          nil];
        
        // Loop through the data and calculate and log BMI for each person:
        NSUInteger numberOfCases = [cases count];
        for (int i = 0; i < numberOfCases; i++)
        {
            BodyMetrics *metrics = cases[i];
            
            // Calculate BMI, and create height string:
            NSNumber *bmi    = [metrics getBMI];
            NSString *height = [Conversions getFeetAndInches:[metrics heightInInches]];
            
            // Write the report for this person:
            NSLog(@"%s's BMI Report:",          metrics.name);
            NSLog(@"- Height    : %@",          height);
            NSLog(@"- Weight    : %.0f lbs",    [metrics weightInLbs]);
            NSLog(@"- BMI       : %.1f",        [bmi floatValue]);
            NSLog(@"- BMI Level : %@\n\n",      [metrics getBMILevel:bmi]);
        }
    }
    return 0;
}

