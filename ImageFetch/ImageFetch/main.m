//
//  main.m
//  ImageFetch
//
//  Created by Arun Agrawal on 26/10/13.
//  Copyright (c) 2013 Arun Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
       
        NSURL *url = [NSURL URLWithString:@"http://static.vocecommunications.com/wp-content/uploads/2010/03/ps-logo-new-2.png"];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        NSError *error = nil;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:NULL
                                                         error:&error];
        
        
        if (!data){
            NSLog(@"fetch failed %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"the file is %lu bytes", [data length]);
        
        BOOL written = [data writeToFile:@"/tmp/google.png"
                                 options:0
                                   error:&error];
        
        if (!written) {
            NSLog(@"write failed %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"Success!");
        
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
        NSLog(@"the data from read file is %lu bytes:", [readData length]);
        
    }
    return 0;
}

