//
//  MetricConverter.m
//  BMI
//
//  Created by Matthew Campbell on 8/15/12.
//  Copyright (c) 2012 Matthew Campbell. All rights reserved.
//

#import "MetricConverter.h"

@implementation MetricConverter

+(float)getHeightInMetersFromThisHeightInInches:(float)height{
    return height * 0.0254;
}

+(float)getWeightInKilogramsFromThisWeightInPounds:(float)weight{
    return weight * 0.453592;
}

@end
