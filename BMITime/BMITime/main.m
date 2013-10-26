//
//  main.m
//  BMITime
//
//  Created by Arun Agrawal on 15/10/13.
//  Copyright (c) 2013 Arun Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        /// create an array if Employee objects
        NSMutableArray *employees = [[NSMutableArray alloc] init];
       
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < 10; i++) {
            // create an instance of Employee
            
            Employee *person = [[Employee alloc] init];
            
            [person setWeightInKilos:90 + i];
            [person setHeightInMeters:1.8 - i/10.0];
            [person setEmployeeID:i];

            // Put the employee in the employees array
            
            [employees addObject:person];
            
            if (i == 0){
                [executives setObject:person forKey:@"CEO"];
            }
            
            if (i == 1){
                [executives setObject:person forKey:@"CTO"];
            }
                
            
        }
       
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        // Create 10 assts
        for (int i = 0; i < 10; i++) {
            
            // Create an asset
            
            Asset *asset = [[Asset alloc] init];
            
            // Give it some label
            
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            
            [asset setLabel:currentLabel];
            [asset setResaleValue:i * 17];
        
            // Get a randome number between 0 and 9
            NSUInteger randomIndex = random() % [employees count];
            
            // Find that employee
            
            Employee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            // Assing the asset to the employee
            
            [randomEmployee addAssetsObject:asset];
            
            [allAssets addObject:asset];
            
        }
       
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *ei = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        
        [employees sortUsingDescriptors:[NSArray arrayWithObjects:voa, ei, nil]];
        
        NSLog(@"Employees %@", employees);
        NSLog(@"Giving up ownership to employee");
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 70"];
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        
        NSLog(@"toBeReclaimed: %@", toBeReclaimed);
        
        toBeReclaimed = nil;
        
        NSLog(@"all assets %@", allAssets);
        
        NSLog(@"executives %@", executives);
        executives = nil;
        
        NSLog(@"Giving up ownership to array");
        
        allAssets = nil;
        employees = nil;
        
    }
    sleep(100);
    return 0;
}