//
//  SyntaxTest.m
//  PeepNews
//
//  Created by Arun Agrawal on 29/09/13.
//  Copyright (c) 2013 Arun Agrawal. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface SyntaxTest : XCTestCase

@end

@implementation SyntaxTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testTrue
{
    XCTAssertTrue(YES, @"Message will be shown on failure");
}

-(void)testString
{
    NSString * myString = @"Bacon";
    XCTAssertEqualObjects(@"Bacon", myString, @"Got %@", myString);
    
}

@end