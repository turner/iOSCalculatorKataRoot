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

-(void)test_GivenSUT_WhenInputIsEmptyString_ThenReturnZero {

    // setup
    NSString *numbers = @"";

    // expectations
    int expectations = 0;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expectations, @"sum does not equal expected value");
}

-(void)test_GivenSUT_WhenInputIsNumber_ThenReturnNumber {

    // setup
    NSString *numbers = @"7";

    // expectations
    int expectations = 7;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expectations, @"sum does not equal expected value");
}

@end
