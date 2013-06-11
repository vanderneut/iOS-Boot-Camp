//
//  Person.m
//  BodyMassIndex
//
//  Created by Erik van der Neut on 6/7/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import "Person.h"
#import "BMI.h"
#import "Conversions.h"

@interface Person()

@end

@implementation Person

-(id) initMetricsForPerson:(char *)name
           withWeightInLbs:(float)lbs
        withHeightInInches:(float)inches
{
    self = [super init];
    if (self)
    {
        self.name           = name;
        self.weightInLbs    = lbs;
        self.heightInInches = inches;
        self.bmi = [[BMI alloc] init];
        self.bmi.person = self;
    }
    return self;
}

/**
 * Returns a string containing a qualifying description of the given BMI level.
 *
 * @return              BMI level
 */
-(NSString *) getBMILevel
{
    NSNumber *bmi = [self.bmi getBMI];
    return [BMI getBMILevel:bmi];
}

@end
