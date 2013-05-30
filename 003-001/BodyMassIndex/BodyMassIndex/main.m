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
    float weight;   // person's weight in lbs
    float height;   // person's height in inches
};

NSValue * createMetrics(float weightInLbs, float heightInInches)
{
    struct BodyMetrics metrics;
    metrics.weight = weightInLbs;
    metrics.height = heightInInches;

    return [NSValue valueWithBytes:&metrics objCType:@encode(struct BodyMetrics)];
}

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // Set up the data:
        NSArray *cases = [NSMutableArray arrayWithObjects:
                                            createMetrics(260.0, 73.0),
                                            createMetrics(289.0, 71.0),
                                            createMetrics( 90.0, 61.0),
                                            createMetrics(105.0, 59.0),
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

            // Calculate BMI, create height string, and log for this person:
            NSNumber *bmi = getBMI(getKg(lbs), getCm(inches));
            NSString *height = getHeight(inches);
            NSLog(@"Case %i: BMI is %.1f (%.0f lbs, %@)", i, [bmi floatValue], lbs, height);
        }
    }
    return 0;
}

