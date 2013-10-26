//
//  Person.h
//  BMITime
//
//  Created by Arun Agrawal on 15/10/13.
//  Copyright (c) 2013 Arun Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    float heightInMeters;
    int weightInKilos;
}

@property float heightInMeters;
@property int weightInKilos;

- (float)bodyMassIndex;
@end
