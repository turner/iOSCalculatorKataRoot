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

    // expect
    int expect = 0;

    // test
    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expect, nil);
}

-(void)test_GivenSUT_WhenInputIsNumber_ThenReturnNumber {

    // setup
    NSString *numbers = @"9";

    // expect
    int expect = 9;

    // test
    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expect, nil);
}

-(void)test_GivenSUT_WhenInputIsTwoNumbers_ThenReturnSum {

    // setup
    NSString *numbers = @"3,7";

    // expect
    int expect = 10;

    // test
    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expect, nil);
}

-(void)test_GivenSUT_WhenInputIs_N_Numbers_ThenReturnSum {

    // setup
    int howmany = arc4random() % 1000;
    NSMutableString *numbers = [NSMutableString string];

    // expect
    int expect = 0;

    // test
    for (int i=0; i<howmany; i++) {
        [numbers appendString:[NSString stringWithFormat:@"%d,", i]];
        expect += i;
    }
    int sum = [_sut add:numbers];

    // verify
    STAssertEquals(sum, expect, nil);
}

@end
