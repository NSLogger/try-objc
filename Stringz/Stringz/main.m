//
//  main.m
//  Stringz
//
//  Created by Arun Agrawal on 26/10/13.
//  Copyright (c) 2013 Arun Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int i = 0; i < 10; i++){
            [str appendString:@"Rails is super cool!\n"];
        }
        
        NSError *error = nil;
        
        BOOL success = [str writeToFile:@"/tmp/cool.txt"
                             atomically:YES
                               encoding:NSUTF8StringEncoding
                                  error:&error];
        
        if (success) {
            NSLog(@"Done Wrting /tmp/cool.txt");
        }else {
            NSLog(@"writing failed: %@", [error localizedDescription]);
        }
        
    }
    return 0;
}