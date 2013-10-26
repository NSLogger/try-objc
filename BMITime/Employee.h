//
//  Employee.h
//  BMITime
//
//  Created by Arun Agrawal on 18/10/13.
//  Copyright (c) 2013 Arun Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Asset.h"

@interface Employee : Person
{
    int employeeID;
    NSMutableSet *assets;
}

@property int employeeID;
- (void)addAssetsObject:(Asset *)a;
- (unsigned int)valueOfAssets;

@end


