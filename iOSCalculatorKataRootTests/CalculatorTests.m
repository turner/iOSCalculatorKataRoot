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

-(void)test_GivenCalculator_WhenInputIsTwoNumbers_ThenReturnSum {

    // setup
    NSString *numbers = @"6,4";

    // set expectations
    int expected = 10;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expected, @"sum %d should equal expected %d", sum, expected);
}

-(void)test_GivenCalculator_WhenInputAnyLengthListOfNumbers_ThenReturnSum {

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
    STAssertEquals(sum, expected, @"sum %d should equal expected %d", sum, expected);
}

-(void)test_GivenCalculator_WhenInputContainsNewLineDelimiter_ThenReturnSum {

    // setup
    NSString *numbers = @"1\n2,3";

    // set expectations
    int expected = 6;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expected, @"sum %d should equal expected %d", sum, expected);
}

-(void)test_GivenCalculator_WhenInputContainsDuplicateDelimiters_ThenExpectedExceptionThrown {
    STAssertThrowsSpecificNamed([_sut add:@"4,5,,"], NSException, @"DuplicateDelimiterException", @"");
}

@end
