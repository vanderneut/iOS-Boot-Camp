//
//  MetricConverter.h
//  BMI
//
//  Created by Matthew Campbell on 8/15/12.
//  Copyright (c) 2012 Matthew Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MetricConverter : NSObject

+(float)getHeightInMetersFromThisHeightInInches:(float)height;
+(float)getWeightInKilogramsFromThisWeightInPounds:(float)weight;

@end
