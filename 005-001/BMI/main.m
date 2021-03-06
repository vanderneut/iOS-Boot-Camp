//
//  main.m
//  BMI
//
//  Created by Matthew Campbell on 8/9/12.
//  Copyright (c) 2012 Matthew Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Study.h"
#import "DataHandler.h"
#import "BMI.h"

/**
@interface BMI (MyBMICategory)

-(NSNumber *)measurement;

@end

@implementation BMI (MyBMICategory)

-(NSNumber *)measurement
{
 if (_measurement) return _measurement;  // RETURN measurement if we already have it //
    
    _measurement = [NSNumber numberWithFloat:703 * self.person.weight / self.person.height];
    
    return _measurement;
}
@end
***/

int main(int argc, const char * argv[]){
    @autoreleasepool {
        
        //Build an array of Person objects
        NSArray *people = @[[[Person alloc]initWithName:@"Tom" thisHeight:73 thisWeight:260],
        [[Person alloc]initWithName:@"Jane" thisHeight:71 thisWeight:289],
        [[Person alloc]initWithName:@"Jim" thisHeight:61 thisWeight:90],
        [[Person alloc]initWithName:@"Tori" thisHeight:59 thisWeight:105]];
        
        // Instantiate new data handler:
        DataHandler *dataHandler = [[DataHandler alloc] init];
        
        //Instantiate new study
        Study *studyObject = [[Study alloc] init];
        studyObject.delegate = dataHandler;
        studyObject.people = [NSMutableArray arrayWithArray:people];
        [studyObject calculateStatistics];
        
        //Change height value to see if it "takes"
        Person *lastPerson = [studyObject.people lastObject];
        lastPerson.height = 1234;
        
        [studyObject calculateStatistics];
    }
    return 0;
}

