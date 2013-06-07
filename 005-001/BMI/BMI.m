//
//  BMI.m
//  BMI
//
//  Created by Matthew Campbell on 8/23/12.
//  Copyright (c) 2012 Matthew Campbell. All rights reserved.
//

#import "BMI.h"

@implementation BMI

-(NSNumber *)measurement{
    if(_measurement)
        return _measurement;
    
    float h = [MetricConverter getHeightInMetersFromThisHeightInInches:self.person.height];
    float w = [MetricConverter getWeightInKilogramsFromThisWeightInPounds:self.person.weight];
    _measurement = [NSNumber numberWithFloat:w / (h * h)];
    
    return _measurement;
}

-(NSString *)level{
    if(_level)
        return _level;
    
    if([self.measurement floatValue] < 18.5)
        _level = @"Underweight";
    if([self.measurement floatValue] >= 18.5 && [self.measurement floatValue] <= 24.9)
        _level = @"Normal";
    if([self.measurement floatValue] >= 25 && [self.measurement floatValue] <= 29.9)
        _level = @"Overweight";
    if([self.measurement floatValue] >= 30)
        _level =  @"Obese";
    
    return _level;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"BMI is %@ which is %@", self.measurement, self.level];
}

@end
