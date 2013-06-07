//
//  CalculatorTests.m
//  iOSCalculatorKataRoot
//
//  Created by Douglass Turner on 06/07/13.
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

-(void)testSanityCheck {

    STAssertNotNil(_sut, nil);

}

-(void)test_GivenSUT_WhenInputIsEmptyString_ThenReturnZero {

    // setup
    NSString *numbers = @"";

    // expectation
    int expectation = 0;

    // test
    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expectation, nil);
}

-(void)test_GivenSUT_WhenInputIsOneNumber_ThenReturnNumber {

    // setup
    NSString *numbers = @"7";

    // expectation
    int expectation = 7;

    // test
    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expectation, nil);
}

-(void)test_GivenSUT_WhenInputIsTwoNumbers_ThenReturnSum {

    // setup
    NSString *numbers = @"7,3,6,4";

    // expectation
    int expectation = 20;

    // test
    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expectation, nil);
}

-(void)test_GivenSUT_WhenInputIs_N_Numbers_ThenReturnSum {

    // setup
    int howmany = arc4random() % 1000;
    NSMutableString *numbers = [NSMutableString string];

    // expectation
    int expectation = 0;

    // test
    for (int i=0; i < howmany; i++) {
        [numbers appendString:[NSString stringWithFormat:@"%d,", i]];
        expectation += i;
    }

    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expectation, nil);
}

@end
