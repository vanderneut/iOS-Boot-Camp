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
        NSNumber *bmi    = [person getBMI];
        NSString *height = [Conversions getFeetAndInches:[person heightInInches]];
        
        // Write the report for this person:
        NSLog(@"%s's BMI Report:",          person.name);
        NSLog(@"- Height    : %@",          height);
        NSLog(@"- Weight    : %.0f lbs",    [person weightInLbs]);
        NSLog(@"- BMI       : %.1f",        [bmi floatValue]);
        NSLog(@"- BMI Level : %@\n\n",      [Person getBMILevel:bmi]);

        totalHeight += [person heightInInches];
        totalWeight += [person weightInLbs];
        totalBMI    += [bmi floatValue];
    }
    
    float averageHeight = totalHeight / numberOfPeople;
    float averageWeight = totalWeight / numberOfPeople;
    float averageBMI    = totalBMI / numberOfPeople;

    // Write the report for this person:
    NSLog(@"Aggregate study results:");
    NSLog(@"- Number of people  : %ld", numberOfPeople);
    NSLog(@"- Average height    : %@", [Conversions getFeetAndInches:averageHeight]);
    NSLog(@"- Average weight    : %.0f lbs", averageWeight);
    NSLog(@"- Average BMI       : %.1f", averageBMI);
    NSLog(@"- Average BMI Level : %@\n\n", [Person getBMILevel:[[NSNumber alloc] initWithFloat:averageBMI]]);
}

@end
