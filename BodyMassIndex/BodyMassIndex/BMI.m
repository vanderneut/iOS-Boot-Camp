//
//  BMI.m
//  BodyMassIndex
//
//  Created by Erik van der Neut on 6/9/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "BMI.h"
#import "Conversions.h"
#import "Person.h"

@implementation BMI

/**
 * Returns the Body Mass Index (BMI), based on the person's weight and height
 *
 * @return              BMI
 */
-(NSNumber *) getBMI
{
    float weightInKg = [Conversions getKg:[self.person weightInLbs]];
    float heightInCm = [Conversions getCm:[self.person heightInInches]];
    return [NSNumber numberWithFloat:weightInKg / powf(0.01 * heightInCm, 2.0)];
}

/**
 * Returns a string containing a qualifying description of the given BMI level.
 *
 * @param   NSNumber    bmi
 * @return              BMI level
 */
+(NSString *) getBMILevel:(NSNumber *)bmi
{
    if      ([bmi floatValue] < 18.5) return @"Underweight";
    else if ([bmi floatValue] < 25)   return @"Normal";
    else if ([bmi floatValue] < 30)   return @"Overweight";
    else                              return @"Obese";
}

@end
