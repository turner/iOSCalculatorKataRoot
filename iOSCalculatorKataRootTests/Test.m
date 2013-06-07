//
//  Test.m
//  iOSCalculatorKataRoot
//
//  Created by Douglass Turner on 06/07/13.
//  Copyright (c) 2013 Elastic Image Software. All rights reserved.
//

#import "Test.h"
#import "Calculator.h"

@implementation Test {
    Calculator *_sut;
}

-(void)setUp {
    [super setUp];
    _sut = [[Calculator alloc] init];
}

-(void)testEmptyStringReturnsZero {

    NSString *numbers = @"";
    int expect = 0;
    int sum = [_sut add:numbers];

    STAssertEquals(sum, expect, nil);
}

-(void)testInputIsOneNumberReturnsNumber {

    NSString *numbers = @"7";
    int expect = 7;
    int sum = [_sut add:numbers];

    STAssertEquals(sum, expect, nil);
}

-(void)testInputIsTwoNumbersReturnsSum {

    NSString *numbers = @"7,3";
    int expect = 10;
    int sum = [_sut add:numbers];

    STAssertEquals(sum, expect, nil);
}

@end
