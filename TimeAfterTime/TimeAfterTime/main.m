//
//  main.m
//  TimeAfterTime
//
//  Created by Arun Agrawal on 05/10/13.
//  Copyright (c) 2013 Arun Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1985];
        [comps setMonth:05];
        [comps setDay:14];

        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *dateOfBirth = [g dateFromComponents:comps];

        NSDate *laterDate = [NSDate date];

        double seconds = [laterDate timeIntervalSinceDate:dateOfBirth];

        NSLog(@"\nMy age is %.2f.", (((seconds/60)/60)/24)/360);


        NSDate *now = [[NSDate alloc] init];

        NSLog(@"\nnow is %@", now);

        NSTimeZone *currentTimeZone = [NSTimeZone systemTimeZone];

        BOOL dayLightSaving = [currentTimeZone isDaylightSavingTime];

        if(dayLightSaving){
            NSLog(@"Yes timezone is daylightsaving");
        }

        else {
            NSLog(@"NO timezone is no daylightsaving");
        }


    }
    return 0;
}
