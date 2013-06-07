//
//  Conversions.h
//  BodyMassIndex
//
//  Created by Erik van der Neut on 5/28/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Conversions : NSObject

NSNumber * getBMI(float weightInKg, float heightInCm);
NSString * getHeight(float inches);
NSString * getBMILevel(NSNumber * bmi);

float getKg(float lbs);
float getLbs(float kg);
float getCm(float inches);
float getInches(float cm);

@end
