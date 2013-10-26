//
//  Logger.m
//  Callbacks
//
//  Created by Arun Agrawal on 26/10/13.
//  Copyright (c) 2013 Arun Agrawal. All rights reserved.
//

#import "Logger.h"

@implementation Logger

- (void)sayOuch:(NSTimer *)t
{
    NSLog(@"Ouch!");
}


// Called when data is in chunk
- (void)connection: (NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    NSLog(@"Received data %lu bytes", [data length]);
    
    //cretea a muetable data
    if (!incomingData) {
        incomingData = [[NSMutableData alloc] init];
    }
    
    [incomingData appendData:data];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    
    NSString *string = [[NSString alloc] initWithData:incomingData encoding:NSUTF8StringEncoding];
    
    incomingData = nil;
    
    NSLog(@"string has %lu char", [string length]);
    
    //See full string
    
 //   NSLog(@"The whole string %@", string);
}


- (void)connection:(NSURLConnection *)connection
    didFailWithError:(NSError *)error
{
    NSLog(@"Error is %@", [error localizedDescription]);
    incomingData = nil;
}


- (void)zoneChange:(NSNotificationCenter *)note
{
    NSLog(@"the system time zone has been changed!");
}
@end
