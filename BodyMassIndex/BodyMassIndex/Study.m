//
//  Study.m
//  BodyMassIndex
//
//  Created by Erik van der Neut on 6/9/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "Study.h"
#import "Person.h"
#import "Conversions.h"
#import "BMI.h"

@implementation Study

-(void)calculateAndReportStats
{
    // Loop through the data and calculate and log BMI for each person:
    long numberOfPeople = [self.people count];
    float totalHeight = 0.0;
    float totalWeight = 0.0;
    float totalBMI = 0.0;
    for (int i = 0; i < numberOfPeople; i++)
    {
        Person *person = self.people[i];
        
        // Calculate BMI, and create height string:
        NSNumber *bmi    = [person.bmi getBMI];
        NSString *height = [Conversions getFeetAndInches:[person heightInInches]];
        
        // Write the report for this person:
        NSLog(@"%s's BMI Report:",          person.name);
        NSLog(@"- Height    : %@",          height);
        NSLog(@"- Weight    : %.0f lbs",    [person weightInLbs]);
        NSLog(@"- BMI       : %.1f",        [bmi floatValue]);
        NSLog(@"- BMI Level : %@\n\n",      [BMI getBMILevel:bmi]);

        totalHeight += [person heightInInches];
        totalWeight += [person weightInLbs];
        totalBMI    += [bmi floatValue];
    }
    
    float averageHeight = totalHeight / numberOfPeople;
    float averageWeight = totalWeight / numberOfPeople;
    float averageBMI    = totalBMI / numberOfPeople;

    [self.delegate logStatistic:averageBMI
              withAverageHeight:averageHeight
              withAverageWeight:averageWeight
             withNumberOfPeople:numberOfPeople];
}

-(void)dealloc
{
    self.delegate = nil;
}

@end
