//
// Created by Douglass Turner on 5/27/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Calculator.h"

@implementation Calculator {

}

- (int)add:(NSString *)numbers {

    numbers = [self handleNewlineDelimiter:numbers];

    [self guardCondition_DuplicateDelimitersNotAllowedWithNumbers:numbers];

    if ([numbers rangeOfString:@","].location != NSNotFound) return [self sum:numbers];

    return [numbers length] > 0 ? [numbers intValue] : 0;
}

- (void)guardCondition_DuplicateDelimitersNotAllowedWithNumbers:(NSString *)numbers {

    if ([numbers rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimiterException" format:@"Duplicate delimiters not allowed."];

}

- (NSString *)handleNewlineDelimiter:(NSString *)numbers {

    return [numbers stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (int)sum:(NSString *)numbers {

    NSArray *tokens = [numbers componentsSeparatedByString:@","];

    int total = 0;
    for (NSString *token in tokens) {
        total += [token intValue];
    }
    return total;
}
@end