//
//  Person.m
//  BodyMassIndex
//
//  Created by Erik van der Neut on 6/7/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "Person.h"
#import "Conversions.h"

@interface Person()

@end

@implementation Person

-(id) initMetricsForPerson:(char *)name
           withWeightInLbs:(float)lbs
        withHeightInInches:(float)inches
{
    self = [super init];
    self.name           = name;
    self.weightInLbs    = lbs;
    self.heightInInches = inches;
    
    return self;
}

/**
 * Returns the Body Mass Index (BMI), based on the person's weight and height
 *
 * @return              BMI
 */
-(NSNumber *) getBMI
{
    float weightInKg = [Conversions getKg:[self weightInLbs]];
    float heightInCm = [Conversions getCm:[self heightInInches]];
    return [NSNumber numberWithFloat:weightInKg / powf(0.01 * heightInCm, 2.0)];
}

/**
 * Returns a string containing a qualifying description of the given BMI level.
 *
 * @return              BMI level
 */
-(NSString *) getBMILevel
{
    NSNumber *bmi = [self getBMI];
    return [Person getBMILevel:bmi];
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
