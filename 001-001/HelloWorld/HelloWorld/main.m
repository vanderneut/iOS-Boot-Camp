//
//  main.m
//  HelloWorld
//
//  Created by Erik van der Neut on 5/26/13.
//  Copyright (c) 2013 Erik van der Neut. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        NSLog(@"Hello, World!");
        
        int i = 12345;
        
        NSString *helloString = @"Hi there, world!";
        
        NSLog(@"helloString:%@, i:%i", helloString, i);
    }
    return 0;
}

