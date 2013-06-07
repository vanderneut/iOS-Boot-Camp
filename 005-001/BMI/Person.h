//
//  Person.h
//  BMI
//
//  Created by Matthew Campbell on 8/15/12.
//  Copyright (c) 2012 Matthew Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BMI;

@interface Person : NSObject

@property(strong)NSString *name;
@property(assign)float height;
@property(assign)float weight;
@property(strong)BMI *bmi;

@property(strong)NSNumber *h;

-(id)initWithName:(NSString *)name
       thisHeight:(float)height
       thisWeight:(float)weight;
-(void)writeReport;

@end