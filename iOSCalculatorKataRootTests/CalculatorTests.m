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
@end
