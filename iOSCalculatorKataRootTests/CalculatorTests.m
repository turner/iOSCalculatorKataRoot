#import <SenTestingKit/SenTestingKit.h>
#import "Calculator.h"

@interface CalculatorTests : SenTestCase {

    Calculator *_sut;
}

@end

@implementation CalculatorTests
- (void)setUp {
    [super setUp];

    _sut = [[Calculator alloc] init];
}

-(void)testGivenCalculator_WhenGetZeroLengthInput_ThenZeroIsReturned {

    NSString *numbers = @"";

    int sum = [_sut add:numbers];

    int expected = 0;
    STAssertEquals(expected, sum, nil);

}

-(void)testGivenCalculator_WhenGetOneNumberInput_ThenNumberIsReturned {

    NSString *numbers = @"5";

    int sum = [_sut add:numbers];

    int expected = 5;
    STAssertEquals(expected, sum, nil);

}

-(void)testGivenCalculator_WhenGetTwoNumberInput_ThenSumIsReturned {

    NSString *numbers = @"4,5";

    int sum = [_sut add:numbers];

    int expected = 9;
    STAssertEquals(expected, sum, nil);

}

@end
