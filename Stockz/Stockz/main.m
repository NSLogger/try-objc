//
//  main.m
//  Stockz
//
//  Created by Arun Agrawal on 26/10/13.
//  Copyright (c) 2013 Arun Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *stock;
        
        stock = [NSMutableDictionary dictionary];
        
        [stock setObject:@"AAPL" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:200] forKey:@"shares"];
        
        [stocks addObject:stock];
        
        stock = [NSMutableDictionary dictionary];
        
        [stock setObject:@"GOOG" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:160] forKey:@"shares"];
        
        [stocks addObject:stock];
        
        [stocks writeToFile:@"/tmp/stocks.plist" atomically:YES];
        
        NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
        
        for (NSDictionary *d in stockList) {
            NSLog(@"i have %@ shares of %@", [d objectForKey:@"shares"], [d objectForKey:@"symbol"]);
        }
        
        // start of challenge code for property list - Not the most efficient way to create objectgs but it does get the task done
        NSMutableArray *plistTypes = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *plistType;
        
        // sparse comments below, given that the forKey pretty much comments on what is being done after the fact
        
        plistType = [NSMutableDictionary dictionary];
        
        NSDate *now = [[NSDate alloc] init];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSData *yesterday = [now dateByAddingTimeInterval:-24.0 *60.0 * 60.0];
        
        NSArray *theNSArray = [NSArray arrayWithObjects:yesterday, now, tomorrow, nil];
        
        [plistType setObject:theNSArray forKey:@"theNSArray"];
        
        [plistTypes addObject:plistType];
        
        plistType = [NSMutableDictionary dictionary];
        
        [stock setObject:@"APPL"
                  forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:200]
                  forKey:@"shares"];
        
        [plistType setObject:stock
                      forKey:@"theNSDictionary"];
        
        [plistTypes addObject:plistType];
        
        plistType = [NSMutableDictionary dictionary];
        
        [plistType setObject:@"This is a NSString"
                      forKey:@"theNSString"];
        
        [plistTypes addObject:plistType];
        
        plistType = [NSMutableDictionary dictionary];
        
        // copy png of your chonce and use that otherwise this will fail (error handling isn't here)
        NSData *dataPNG = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
        // if dataPNG is NULL, you'll know it here.
        [plistType setObject:dataPNG
                      forKey:@"theNSData"];
        
        [plistTypes addObject:plistType];
        
        plistType = [NSMutableDictionary dictionary];
        
        [plistType setObject:now
                      forKey:@"theNSDate"];
        
        [plistTypes addObject:plistType];
        
        plistType = [NSMutableDictionary dictionary];
        
        [plistType setObject:[NSNumber numberWithInt:100]
                      forKey:@"theInteger"];
        
        [plistTypes addObject:plistType];
        
        plistType = [NSMutableDictionary dictionary];
        
        [plistType setObject:[NSNumber numberWithFloat:100.00005]
                      forKey:@"theFloat"];
        
        [plistTypes addObject:plistType];
        
        plistType = [NSMutableDictionary dictionary];
        
        [plistType setObject:[NSNumber numberWithBool:YES]
                      forKey:@"theBOOL"];
        
        [plistTypes addObject:plistType];
        
        [plistTypes writeToFile:@"/tmp/plistType.plist"
                     atomically:YES];
        
        NSArray *plistTypeList = [NSArray arrayWithContentsOfFile:@"/tmp/plistType.plist"];
        
        // This seems a little kludgey, but it works -- probably a recursion type call would be a better implementation here
        for (NSDictionary *d in plistTypeList) {
            for (id key in d) {
                NSDictionary *innerItem = [d objectForKey:key];
                // comment out if if you want to use just classname to confirm contents
                if ([innerItem isKindOfClass:[NSArray class]]) {
                    NSLog(@"theNSArray");
                } else if ([innerItem isKindOfClass:[NSDictionary class]]) {
                    NSLog(@"theNSDictionary");
                } else if ([innerItem isKindOfClass:[NSString class]]) {
                    NSLog(@"theNSString");
                } else if ([innerItem isKindOfClass:[NSData class]]) {
                    NSLog(@"theNSData");
                    // remove next line if you want to print contents of theNSData
                    continue;
                } else if ([innerItem isKindOfClass:[NSDate class]]) {
                    NSLog(@"theNSDate");
                } else if ([innerItem isKindOfClass:[NSNumber class]]) {
                    NSLog(@"NSNUMBER");
                }
                // [innerItem className] sort of confirms I've got this but I don't know how to distingush between, integer, float and boolean
                NSLog(@"Contents: %@ of type %@", d, [innerItem className]);
            }
        }
        
        NSLog(@"Done again!");
        
    }
    
    return 0;
}