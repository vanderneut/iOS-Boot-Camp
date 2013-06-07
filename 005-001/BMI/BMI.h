//
//  BMI.h
//  BMI
//
//  Created by Matthew Campbell on 8/23/12.
//  Copyright (c) 2012 Matthew Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MetricConverter.h"
#import "Person.h"

@interface BMI : NSObject{
@private
    NSNumber *_measurement;
    NSString *_level;
}

@property(strong)Person *person;
@property(readonly, strong)NSNumber *measurement;
@property(readonly, strong)NSString *level;

@end
