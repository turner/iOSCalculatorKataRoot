//
// Created by Douglass Turner on 5/28/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Calculator.h"


@implementation Calculator {

}
- (int)add:(NSString *)numbers {

    numbers = [self handleCustomDelimiterContainedWithinNumbers:numbers];

    numbers = [self handleNewLineDelimiterWithinNumbers:numbers];

    [self guardCondition_RejectDuplicateDelimitersWithinNumbers:numbers];

    if (YES == [self containsWithin:numbers delimiter:@"," ]) return [self sum:numbers];

    return [numbers length] > 0 ? [numbers intValue] : 0;

}

- (void)guardCondition_RejectDuplicateDelimitersWithinNumbers:(NSString *)numbers {

    if (YES == [self containsWithin:numbers delimiter:@",,"])
        [NSException raise:@"DuplicateDelimiterException" format:@""];
}

- (NSString *)handleCustomDelimiterContainedWithinNumbers:(NSString *)numbers {

    if (YES == [numbers hasPrefix:@"//"]) {

        NSString *delimiter = [numbers substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbers substringWithRange:NSMakeRange(4, [numbers length] - 4)];

        numbers = [suffix stringByReplacingOccurrencesOfString:delimiter withString:@","];
    }

    return numbers;
}

- (NSString *)handleNewLineDelimiterWithinNumbers:(NSString *)numbers {
    return [numbers stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (BOOL)containsWithin:(NSString *)numbers delimiter:(NSString *)delimiter {
    return [numbers rangeOfString:delimiter].location != NSNotFound;
}

- (int)sum:(NSString *)numbers {

    NSArray *tokens = [numbers componentsSeparatedByString:@","];

    int total = 0;
    for (NSString *number in tokens) {

        [self guardCondition_RejectNegativeNumber:number];

        total += [number intValue];
    }

    return total;
}

- (void)guardCondition_RejectNegativeNumber:(NSString *)number {

    if ([number intValue] < 0) [NSException raise:@"NegativeNumberException" format:@""];

}

@end