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

-(void)test_GivenSUT_WhenInputIsTwoNumbers_ThenReturnNumber {

    // setup
    NSString *numbers = @"7,3";

    // expectations
    int expectations = 10;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expectations, @"sum does not equal expected value");
}


-(void)test_GivenSUT_WhenInputIsListOfNumbers_ThenReturnNumber {

    // setup
    int howmany = arc4random() % 1000;
    NSMutableString *numbers = [NSMutableString string];

    // expectations
    int expectations = 0;

    // perform test
    for (int i=0; i < howmany; i++) {
        [numbers appendString:[NSString stringWithFormat:@"%d,", i]];
        expectations += i;
    }
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expectations, @"sum does not equal expected value");
}

-(void)test_GivenSUT_WhenInputContainsNewlineDelimiter_ThenReturnNumber {

    // setup
    NSString *numbers = @"7,3\n10";

    // expectations
    int expectations = 20;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expectations, @"sum does not equal expected value");
}

-(void)test_GivenSUT_WhenInputContainsDuplicateDelimiters_ThrowExpectedException {
    STAssertThrowsSpecificNamed([_sut add:@"7,3,\n10"], NSException, @"DuplicateDelimiterException", @"");
}

-(void)test_GivenSUT_WhenInputContainsCustonDelimiter_ThenReturnNumber {

    // setup
    NSString *numbers = @"//$\n7$3$10,20";

    // expectations
    int expectations = 40;

    // perform test
    int sum = [_sut add:numbers];

    // verify test
    STAssertEquals(sum, expectations, @"sum does not equal expected value");
}

@end
