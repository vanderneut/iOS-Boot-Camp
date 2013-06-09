//
//  main.m
//  BodyMassIndex
//
//  Created by Erik van der Neut on 5/28/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Conversions.h"
#import "Person.h"
#import "Study.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // Set up the data:
        NSArray *data = @[[[Person alloc] initMetricsForPerson:"Tom" withWeightInLbs:260.0 withHeightInInches:73.0],
                          [[Person alloc] initMetricsForPerson:"Jane" withWeightInLbs:289.0 withHeightInInches:71.0],
                          [[Person alloc] initMetricsForPerson:"Jim" withWeightInLbs:90.0 withHeightInInches:61.0],
                          [[Person alloc] initMetricsForPerson:"Tori" withWeightInLbs:105.0 withHeightInInches:59.0],
                          [[Person alloc] initMetricsForPerson:"Erik" withWeightInLbs:134.0 withHeightInInches:67.0],
                          [[Person alloc] initMetricsForPerson:"Lorah" withWeightInLbs:110.0 withHeightInInches:62.0]];

        Study *study = [[Study alloc] init];
        study.people = [NSMutableArray arrayWithArray:data];
        
        [study calculateAndReportStats];        
    }
    return 0;
}

