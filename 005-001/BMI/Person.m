//
//  Person.m
//  BMI
//
//  Created by Matthew Campbell on 8/15/12.
//  Copyright (c) 2012 Matthew Campbell. All rights reserved.
//

#import "Person.h"
#import "BMI.h"

@implementation Person

-(id)initWithName:(NSString *)name thisHeight:(float) height thisWeight:(float)weight{
    self = [super init];
    if (self) {
        self.name = name;
        self.height = height;
        self.weight = weight;
        self.bmi = [[BMI alloc] init];
        self.bmi.person = self;
    }
    return self;
}

-(void)writeReport{
     NSLog(@"%@'s BMI is %@", self.name, self.bmi);
}


float _height;

-(float)height{
    return _height;
}

-(void)setHeight:(float)height{
    _height = height;
    self.bmi = [[BMI alloc] init];
    self.bmi.person = self;
}

@end
