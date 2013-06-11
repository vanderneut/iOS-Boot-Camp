//
//  BMI.h
//  BodyMassIndex
//
//  Created by Erik van der Neut on 6/9/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface BMI : NSObject
{
    @private
    NSNumber *_measurement;
    NSString *_level;
}

@property(strong)Person *person;
@property(readonly, strong)NSNumber *measurement;
@property(readonly, strong)NSString *level;

-(NSNumber *) getBMI;
+(NSString *) getBMILevel:(NSNumber *)bmi;

@end
