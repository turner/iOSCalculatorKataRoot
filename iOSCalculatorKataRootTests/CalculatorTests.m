//
//  CalculatorTests.m
//  iOSCalculatorKataRoot
//
//  Created by Douglass Turner on 06/03/13.
//  Copyright (c) 2013 Elastic Image Software. All rights reserved.
//

#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests {
    Calculator *_sut;
}

-(void)setUp {

    [super setUp];
    _sut = [[Calculator alloc] init];
}

-(void)test_GivenSUT_WhenInputIsEmptyString_ThenReturnZero {

    // setup
    NSString *numbers = @"";

    // expectations
    int expectations = 0;

    // test
    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expectations, @"sum should equal expectations");

}
@end
