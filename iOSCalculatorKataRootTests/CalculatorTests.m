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

-(void)test_GivenCalculator_WhenInputIsEmptyString_ThenReturnZero {

    // setup
    NSString *numbers = @"";

    // set expectations
    int expectation = 0;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expectation, nil);

}

-(void)test_GivenCalculator_WhenInputIsOneNumber_ThenReturnNumber {

    // setup
    NSString *numbers = @"5";

    // set expectations
    int expectation = 5;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expectation, nil);

}

-(void)test_GivenCalculator_WhenInputIsTwoNumbers_ThenReturnSum {

    // setup
    NSString *numbers = @"4,8";

    // set expectations
    int expectation = 12;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expectation, nil);

}

@end
