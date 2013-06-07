//
//  main.m
//  BodyMassIndex
//
//  Created by Erik van der Neut on 5/28/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Conversions.h"

struct BodyMetrics
{
    char * name;    // person's name
    float weight;   // person's weight in lbs
    float height;   // person's height in inches
};

NSValue * createMetrics(char * name, float weightInLbs, float heightInInches)
{
    struct BodyMetrics metrics;
    metrics.name    = name;
    metrics.weight  = weightInLbs;
    metrics.height  = heightInInches;
    
    return [NSValue valueWithBytes:&metrics objCType:@encode(struct BodyMetrics)];
}

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // Set up the data:
        NSArray *cases = [NSMutableArray arrayWithObjects:
                          createMetrics("Tom", 260.0, 73.0),
                          createMetrics("Jane", 289.0, 71.0),
                          createMetrics("Jim", 90.0, 61.0),
                          createMetrics("Tori", 105.0, 59.0),
                          createMetrics("Erik", 141.0, 67.0),
                          nil];
        
        // Loop through the data and calculate and log BMI for each person:
        NSUInteger numberOfCases = [cases count];
        for (int i = 0; i < numberOfCases; i++)
        {
            // Retrieve metrics structure from the NSValue in the NSArray:
            NSValue *metricsValue = cases[i];
            struct BodyMetrics metrics;
            [metricsValue getValue:&metrics];
            
            // Get lbs and inches for easier reference:
            float lbs = metrics.weight;
            float inches = metrics.height;
            
            // Calculate BMI, and create height string:
            NSNumber *bmi = getBMI(getKg(lbs), getCm(inches));
            NSString *height = getHeight(inches);
            
            // Write the report for this person:
            NSLog(@"%s's BMI Report:",          metrics.name);
            NSLog(@"- Height    : %@",          height);
            NSLog(@"- Weight    : %.0f lbs",    lbs);
            NSLog(@"- BMI       : %.1f",        [bmi floatValue]);
            NSLog(@"- BMI Level : %@\n\n",      getBMILevel(bmi));
        }
    }
    return 0;
}

