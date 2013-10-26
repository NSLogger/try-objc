//
//  Asset.m
//  BMITime
//
//  Created by Arun Agrawal on 18/10/13.
//  Copyright (c) 2013 Arun Agrawal. All rights reserved.
//

#import "Asset.h"
#import "Employee.h"

@implementation Asset

@synthesize label, resaleValue, holder;

-(NSString *)description
{
    // is holder non-nil?
    if ([self holder]) {
        return [NSString stringWithFormat:@"%@: $%d, assigned to %@>",
                [self label], [self resaleValue], [self holder]];
        
    }
    
    else
        
    {
        return [NSString stringWithFormat:@"%@: $%d, unassigned>",
                [self label], [self resaleValue]];
        
    }
    
}

-(void)dealloc
{
    NSLog(@"deallocating %@", self);
}
@end
