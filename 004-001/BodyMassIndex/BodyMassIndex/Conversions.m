//
//  Conversions.m
//  BodyMassIndex
//
//  Created by Erik van der Neut on 5/28/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "Conversions.h"

@implementation Conversions

/**
 * Returns the Body Mass Index (BMI), given someone's weight in kilograms and
 * their height in centimeters.
 * 
 * @param weightInKg    weight in kilograms
 * @param heightInCm    height in centimeters
 * @return              BMI
 */
NSNumber * getBMI(float weightInKg, float heightInCm)
{
    return [NSNumber numberWithFloat:weightInKg / powf(0.01 * heightInCm, 2.0)];
}

/**
 * Returns a string containing a qualifying description of the given BMI level.
 */
NSString * getBMILevel(NSNumber * bmi)
{
    if      ([bmi floatValue] < 18.5) return @"Underweight";
    else if ([bmi floatValue] < 25)   return @"Normal";
    else if ([bmi floatValue] < 30)   return @"Overweight";
    else                              return @"Obese";
}

/**
 * Convers inches to a string that indicates feet and inches, e.g. 5'7"
 *
 * @param inches    height in inches
 * @return          string describing height in feet and inches
 */
NSString * getHeight(float inches)
{
    int feet = (int) inches / 12;
    int inch = (int) fmodf(inches, 12);     // floating point modulus
    
    return [NSString stringWithFormat:@"%i'%i\"", feet, inch];
}

/**
 * Converts pounds to kilograms
 *
 * @param   lbs     weight in pounds
 * @return          weight in kilograms
 */
float getKg(float lbs)
{
    return lbs * 0.453592;
}

/**
 * Converts kilograms to pounds
 *
 * @param   kg      weight in kilograms
 * @return          weight in pounds
 */
float getLbs(float kg)
{
    return kg * 2.20462;
}

/**
 * Converts inches to centimeters
 *
 * @param   inches  height in inches
 * @return          height in centimeters
 */
float getCm(float inches)
{
    return inches * 2.54;
}

/**
 * Converts centimeters to inches
 *
 * @param   cm      height in centimeters
 * @return          height in inches
 */
float getInches(float cm)
{
    return cm * 0.393701;
}


@end
