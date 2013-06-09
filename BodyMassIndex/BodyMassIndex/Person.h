//
//  Person.h
//  BodyMassIndex
//
//  Created by Erik van der Neut on 6/7/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property char * name;          // person's name
@property float weightInLbs;    // person's weight in lbs
@property float heightInInches; // person's height in inches

-(id) initMetricsForPerson:(char *)name
           withWeightInLbs:(float)lbs
        withHeightInInches:(float)inches;
-(NSNumber *) getBMI;
-(NSString *) getBMILevel;
-(NSString *) getBMILevel:bmi;

@end
