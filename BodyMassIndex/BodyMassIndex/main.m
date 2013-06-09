//
//  main.m
//  BodyMassIndex
//
//  Created by Erik van der Neut on 5/28/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Conversions.h"
#import "Person.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // Set up the data:
        NSArray *cases = [NSMutableArray arrayWithObjects:
                          [[Person alloc] initMetricsForPerson:"Tom" withWeightInLbs:260.0 withHeightInInches:73.0],
                          [[Person alloc] initMetricsForPerson:"Jane" withWeightInLbs:289.0 withHeightInInches:71.0],
                          [[Person alloc] initMetricsForPerson:"Jim" withWeightInLbs:90.0 withHeightInInches:61.0],
                          [[Person alloc] initMetricsForPerson:"Tori" withWeightInLbs:105.0 withHeightInInches:59.0],
                          [[Person alloc] initMetricsForPerson:"Erik" withWeightInLbs:134.0 withHeightInInches:67.0],
                          [[Person alloc] initMetricsForPerson:"Lorah" withWeightInLbs:110.0 withHeightInInches:62.0],
                          nil];
        
        // Loop through the data and calculate and log BMI for each person:
        NSUInteger numberOfCases = [cases count];
        for (int i = 0; i < numberOfCases; i++)
        {
            Person *person = cases[i];
            
            // Calculate BMI, and create height string:
            NSNumber *bmi    = [person getBMI];
            NSString *height = [Conversions getFeetAndInches:[person heightInInches]];
            
            // Write the report for this person:
            NSLog(@"%s's BMI Report:",          person.name);
            NSLog(@"- Height    : %@",          height);
            NSLog(@"- Weight    : %.0f lbs",    [person weightInLbs]);
            NSLog(@"- BMI       : %.1f",        [bmi floatValue]);
            NSLog(@"- BMI Level : %@\n\n",      [person getBMILevel:bmi]);
        }
    }
    return 0;
}

