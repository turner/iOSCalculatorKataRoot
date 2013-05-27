#import <SenTestingKit/SenTestingKit.h>
#import "Calculator.h"

@interface CalculatorTests : SenTestCase

@end

@implementation CalculatorTests {
    Calculator *_sut;
}

-(void)setUp {
    [super setUp];

    _sut = [[Calculator alloc] init];
}

-(void)testUnitTestRecipe {

    // setup

    // set expectations

    // perform test

    // verify test

    STAssertEquals(YES, YES, nil);
}

-(void)test_GivenSUT_WhenUsedInUnitTest_ThenShouldNotBeNil {
    STAssertNotNil(_sut, @"SUT should not be nil");
}

-(void)test_GivenSUT_WhenInputIsEmptyString_ThebReturnZero {

    NSString *numbers = @"";

    int expected = 0;
    int sum = [_sut add:numbers];

    STAssertEquals(expected, sum, @"sum %d should be %d", sum, expected);
}

-(void)test_GivenSUT_WhenInputIsOneNumber_ThenReturnInput {

    NSString *numbers = @"7";

    int expected = 7;

    int sum = [_sut add:numbers];

    STAssertEquals(expected, sum, @"sum %d should be %d", sum, expected);
}

-(void)test_GivenSUT_WhenInputIsTwoNumbers_ThenReturnSum {

    // setup
    NSString *numbers = @"7,5";

    // set expectations
    int expected = 12;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(expected, sum, @"sum %d should be %d", sum, expected);
}


@end
