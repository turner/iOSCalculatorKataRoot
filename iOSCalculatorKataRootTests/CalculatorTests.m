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

-(void)test_GivenCalculator_WhenInputIsAnyLengthListOfNumbers_ThenReturnSum {

    // setup
    int howmany = arc4random() % 999;
    NSMutableString *numbers = [NSMutableString string];

    // set expectations
    int expectation = 0;

    // perform test
    for (int i = 0; i < howmany; i++) {
        [numbers appendString:[NSString stringWithFormat:@"%d,", i]];
        expectation += i;
    }
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expectation, nil);

}

-(void)test_GivenCalculator_WhenInputContainsNewLineDelimiter_ThenReturnSum {

    // setup
    NSString *numbers = @"4,8\n12";

    // set expectations
    int expectation = 24;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expectation, nil);

}

-(void)test_GivenCalculator_WhenInputContainsDuplicateDelimiters_ThenThrowExpectedException {

    STAssertThrowsSpecificNamed([_sut add:@"2,3,,5"], NSException, @"DuplicateDelimitersException", @"");
}

-(void)test_GivenCalculator_WhenInputContainsCustomLineDelimiter_ThenReturnSum {

    // setup
    NSString *numbers = @"//$\n4$8,12";

    // set expectations
    int expectation = 24;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expectation, nil);

}

-(void)test_GivenCalculator_WhenInputContainsNegativeNumbers_ThenThrowExpectedException {

    STAssertThrowsSpecificNamed([_sut add:@"-5"], NSException, @"NegativeNumberException", @"");

//    STAssertThrowsSpecificNamed([_sut add:@"2,3,-4,-5"], NSException, @"NegativeNumberException", @"");
}

@end
