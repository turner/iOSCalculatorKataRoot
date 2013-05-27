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

-(void)test_GivenSUT_WhenUsedInUnitTest_ThenShouldNotBeNil {
    STAssertNotNil(_sut, @"SUT should not be nil");
}

-(void)test_GivenSUT_WhenInputIsEmptyString_ThebReturnZero {

    int expected = 0;

    NSString *numbers = @"";
    int sum = [_sut add:numbers];

    STAssertEquals(expected, sum, @"sum %d should be %d", sum, expected);
}

-(void)test_GivenSUT_WhenInputIsOneNumber_ThenReturnInput {
    
    int expected = 7;

    NSString *numbers = @"7";
    int sum = [_sut add:numbers];

    STAssertEquals(expected, sum, @"sum %d should be %d", sum, expected);
}


@end
