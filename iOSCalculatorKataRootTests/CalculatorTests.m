#import <SenTestingKit/SenTestingKit.h>
#import "Calculator.h"

@interface CalculatorTests : SenTestCase

@end

@implementation CalculatorTests {
    Calculator *_sut;
}

- (void)setUp {
    [super setUp];

    _sut = [[Calculator alloc] init];
}

-(void)test_GivenCalculator_WhenInputIsEmptyString_ThenReturnZero {

    // setup
    NSString *numbers = @"";

    // set expectations
    int expected = 0;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expected, @"sum %d should equal expected %d", sum, expected);
}

-(void)test_GivenCalculator_WhenInputIsOneNumber_ThenReturnNumber {

    // setup
    NSString *numbers = @"5";

    // set expectations
    int expected = 5;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expected, @"sum %d should equal expected %d", sum, expected);
}

@end
