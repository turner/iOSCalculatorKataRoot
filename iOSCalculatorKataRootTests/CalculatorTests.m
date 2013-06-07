//
//  CalculatorTests.m
//  iOSCalculatorKataRoot
//
//  Created by Douglass Turner on 06/07/13.
//  Copyright (c) 2013 Elastic Image Software. All rights reserved.
//

#import "CalculatorTests.h"
#import "Calculator.h"
#import "IScientificCalculator.h"
#import "ScientificCalculator.h"

@implementation CalculatorTests {
    Calculator *_sut;
}

-(void)setUp {
    [super setUp];
    _sut = [[Calculator alloc] init];
}

-(void)testEmptyStringReturnsZero {

    NSString *numbers = @"";
    int expect = 0;
    int sum = [_sut add:numbers];

    STAssertEquals(sum, expect, nil);
}

-(void)testInputIsOneNumberReturnsNumber {

    NSString *numbers = @"7";
    int expect = 7;
    int sum = [_sut add:numbers];

    STAssertEquals(sum, expect, nil);
}

-(void)testInputIsTwoNumbersReturnsSum {

    NSString *numbers = @"7,3";
    int expect = 10;
    int sum = [_sut add:numbers];

    STAssertEquals(sum, expect, nil);
}

-(void)testInputIsNNumbersReturnsSum {

    int howmany = arc4random() % 1000;

    NSMutableString *numbers = [NSMutableString string];
    int expect = 0;

    for (int i=0; i < howmany; i++) {

        [numbers appendString:[NSString stringWithFormat:@"%d,", i]];
        expect += i;

    }
    int sum = [_sut add:numbers];

    STAssertEquals(sum, expect, nil);
}

-(void)testScientificCalculatorHack {

    id<IScientificCalculator>scientificCalculator = [[ScientificCalculator alloc] init];

    int result = (int) [scientificCalculator sqrt:4 notOnFriday:0];
    STAssertEquals(result, 2, nil);
}
@end
