//
//  Person.h
//  BodyMassIndex
//
//  Created by Erik van der Neut on 6/7/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BMI;

@interface Person : NSObject

@property (assign) char * name;          // person's name
@property (assign) float weightInLbs;    // person's weight in lbs
@property (assign) float heightInInches; // person's height in inches
@property (strong) BMI *bmi;             // person's Body Mass Index

-(id) initMetricsForPerson:(char *)name
           withWeightInLbs:(float)lbs
        withHeightInInches:(float)inches;
//-(NSNumber *) getBMI;
-(NSString *) getBMILevel;

@end
