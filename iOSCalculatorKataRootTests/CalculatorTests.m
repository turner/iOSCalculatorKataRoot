#import <SenTestingKit/SenTestingKit.h>
#import "Calculator.h"
#import "IScientificCalculator.h"
#import "ScientificCalculator.h"
#import "OCMockObject.h"
#import "OCMockRecorder.h"

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

-(void)test_ScientificCalculator_SanityTest {

    id<IScientificCalculator>scientificCalculator = [[ScientificCalculator alloc] init];
    STAssertNotNil(scientificCalculator, nil);
}

- (void)test_GivenCalculatorWithScientificCalculatorMock_WhenInputsToPowerDifferFromExpectedInputsTestFailsAsItShould {

    id scientificCalculator = [OCMockObject mockForProtocol:@protocol(IScientificCalculator)];
    [[[scientificCalculator expect] andReturn:[NSNumber numberWithDouble:9]] pow:[NSNumber numberWithDouble:3]
                                                                           power:[NSNumber numberWithDouble:2]];

    Calculator *calculator = [[Calculator alloc] initWithScientificCalculator:scientificCalculator];

    // this SHOULD - and does - fail because the inputs 2,2 differ from the expected inputs of 3,2.
    (void) [calculator.scientificCalculator pow:[NSNumber numberWithDouble:2]
                                          power:[NSNumber numberWithDouble:2]];


    [scientificCalculator verify];

}
@end
