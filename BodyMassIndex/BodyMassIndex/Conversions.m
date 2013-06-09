//
//  Conversions.m
//  BodyMassIndex
//
//  Created by Erik van der Neut on 5/28/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "Conversions.h"

@interface Conversions ()

@end

@implementation Conversions

/**
 * Convers inches to a string that indicates feet and inches, e.g. 5'7"
 *
 * @param inches    height in inches
 * @return          string describing height in feet and inches
 */
+(NSString *) getFeetAndInches:(float)inches
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
+(float) getKg:(float)lbs
{
    return lbs * 0.453592;
}

/**
 * Converts kilograms to pounds
 *
 * @param   kg      weight in kilograms
 * @return          weight in pounds
 */
+(float) getLbs:(float)kg
{
    return kg * 2.20462;
}

/**
 * Converts inches to centimeters
 *
 * @param   inches  height in inches
 * @return          height in centimeters
 */
+(float) getCm:(float)inches
{
    return inches * 2.54;
}

/**
 * Converts centimeters to inches
 *
 * @param   cm      height in centimeters
 * @return          height in inches
 */
+(float) getInches:(float)cm
{
    return cm * 0.393701;
}

@end
