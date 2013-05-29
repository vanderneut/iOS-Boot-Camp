//
//  main.m
//  BodyMassIndex
//
//  Created by Erik van der Neut on 5/28/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Conversions.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        // Set up the data:
        int id = 1;
        float lbs = 260.0;
        float inches = 73.0;
        
        // Loop through the data and calculate and log BMI for each person:
        NSNumber *bmi = getBMI(getKg(lbs), getCm(inches));
        NSString *height = getHeight(inches);
        NSLog(@"Case %i: BMI is %@ (%f lbs, %@)", id, bmi, lbs, height);
    }
    return 0;
}

