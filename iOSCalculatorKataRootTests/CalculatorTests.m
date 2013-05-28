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

-(void)test_GivenCalculator_WhenEmptyInput_ThenReturnZero {

    // setup
    NSString *numbers = @"";

    // set expectations
    int expected = 0;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(expected, sum, @"sum should be zero(0)");


}

-(void)test_GivenCalculator_WhenInputIsOneNumber_ThenReturnNumber {

    // setup
    NSString *numbers = @"5";

    // set expectations
    int expected = 5;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(expected, sum, @"sum %d should be %d", sum, expected);


}

-(void)test_GivenCalculator_WhenInputIsTwoNumbers_ThenReturnSum {

    // setup
    NSString *numbers = @"9,7";

    // set expectations
    int expected = 16;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(expected, sum, @"sum %d should be %d", sum, expected);


}

-(void)test_GivenCalculator_WhenInputIsAnyLengthListOfNumbers_ThenReturnSum {

    // setup
    int howmany = arc4random() % 999;
    NSMutableString *numbers = [NSMutableString string];

    // set expectations
    int expected = 0;

    // perform test
    for (int i = 0; i < howmany; i++) {
        [numbers appendString:[NSString stringWithFormat:@"%d,", i]];
        expected += i;
    }

    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(expected, sum, @"sum %d should be %d", sum, expected);


}

-(void)test_GivenCalculator_WhenInputDelimiterIsNewline_ThenReturnSum {

    // setup
    NSString *numbers = @"9,7\n4";

    // set expectations
    int expected = 20;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(expected, sum, @"sum %d should be %d", sum, expected);


}

-(void)test_GivenCalculator_WhenInputContainsDuplicateDelimiters_ThenThrowsExpectException {

    NSString *numbers = @"3\n,4,5";
    STAssertThrowsSpecificNamed([_sut add:numbers], NSException, @"DuplicateDelimiterException", @"");

}

-(void)test_GivenCalculator_WhenInputContainsCustomDelimiter_ThenReturnSum {

    // setup
    NSString *numbers = @"//%\n3%5%2,4%6";

    // set expectations
    int expected = 20;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(expected, sum, @"sum %d should be %d", sum, expected);


}

-(void)test_GivenCalculator_WhenInputContainsNegativeNumbers_ThenThrowsExpectException {

    NSString *numbers = @"3,-3,4,-4";
    STAssertThrowsSpecificNamed([_sut add:numbers], NSException, @"NegativeNumberException", @"");

}

@end
