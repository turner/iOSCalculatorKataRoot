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

-(void)test_GivenSUT_WhenInputIsNumber_ThenReturnNumber {

    // setup
    NSString *numbers = @"103";

    // expectations
    int expectations = 103;

    // test
    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expectations, @"sum should equal expectations");

}

-(void)test_GivenSUT_WhenInputIsTwoNumbers_ThenReturnSum {

    // setup
    NSString *numbers = @"3,7,6,4";

    // expectations
    int expectations = 20;

    // test
    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expectations, @"sum should equal expectations");

}

-(void)test_GivenSUT_WhenInputIsAnyLengthListOfNumbers_ThenReturnSum {

    // setup
    int howmany = arc4random() % 1000;
    NSMutableString *numbers = [NSMutableString string];

    // expectations
    int expectations = 0;

    // test
    for (int i = 0; i < howmany; i++) {
        [numbers appendString:[NSString stringWithFormat:@"%d,", i]];
        expectations += i;
    }
    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expectations, @"sum should equal expectations");

}

-(void)test_GivenSUT_WhenInputContainsNewlineDelimiter_ThenReturnSum {

    // setup
    NSString *numbers = @"3,7\n6,4";

    // expectations
    int expectations = 20;

    // test
    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expectations, @"sum should equal expectations");

}

-(void)test_GivenSUT_WhenInputContainsDuplicateDelimiters_ThrowExpectedException {
    NSString *numbers = @"3,7,\n";
    STAssertThrowsSpecificNamed([_sut add:numbers], NSException, @"DuplicateDelimitersException", @"");
}

//-(void)test_GivenSUT_WhenInputContainsCustomDelimiter_ThenReturnSum {
//
//    // setup
//    NSString *numbers = @"//$\n3$7$6$4";
//
//    // expectations
//    int expectations = 20;
//
//    // test
//    int sum = [_sut add:numbers];
//
//    // verify
//    STAssertEquals(sum, expectations, @"sum should equal expectations");
//
//}

@end
