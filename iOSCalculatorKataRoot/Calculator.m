//
// Created by Douglass Turner on 5/29/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Calculator.h"


@implementation Calculator {

}
- (int)add:(NSString *)numbers {

    if (YES == [numbers hasPrefix:@"//"]) {
        NSString *delimiter = [numbers substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbers substringWithRange:NSMakeRange(4, [numbers length] - 4)];
        numbers = [suffix stringByReplacingOccurrencesOfString:delimiter withString:@","];
    }

    numbers = [self handleNewLineDelimiter:numbers];

    [self guardCondition_RejectDuplicateDelimitersWithNumbers:numbers];

    if (YES == [self containsWithinNumbers:numbers delimiter:@","]) {
        return [self sum:numbers];
    }

    return [numbers length] > 0 ? [numbers intValue] : 0;
}

- (NSString *)handleNewLineDelimiter:(NSString *)numbers {
    return [numbers stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (void)guardCondition_RejectDuplicateDelimitersWithNumbers:(NSString *)numbers {

    if (YES == [self containsWithinNumbers:numbers delimiter:@",,"]) {
        [NSException raise:@"DuplicateDelimiterException" format:@""];
    }
}

- (int)sum:(NSString *)numbers {
    NSArray *tokens = [numbers componentsSeparatedByString:@","];
    int total = 0;
    for (NSString *token in tokens) {
            total += [token intValue];
        }
    return total;
}

- (BOOL)containsWithinNumbers:(NSString *)numbers delimiter:(NSString *)delimiter {
    return [numbers rangeOfString:delimiter].location != NSNotFound;
}

@end