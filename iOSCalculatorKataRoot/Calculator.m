//
// Created by Douglass Turner on 5/30/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Calculator.h"


@implementation Calculator {

}
- (int)add:(NSString *)numbers {

    numbers = [self handleNewLineDelimiterWithinNumbers:numbers];

    if ([numbers rangeOfString:@",,"].location != NSNotFound) [NSException raise:@"DuplicateDelimitersException" format:@""];

    if (YES == [self containsWithinNumbers:numbers delimiter:@","]) {
        return [self sumNumbers:numbers];
    }

    return [numbers length] > 0 ? [numbers intValue] : 0;
}

- (NSString *)handleNewLineDelimiterWithinNumbers:(NSString *)numbers {
    return [numbers stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (int)sumNumbers:(NSString *)numbers {
    NSArray *tokens = [numbers componentsSeparatedByString:@","];
    int total = 0;
    for (NSString *token in tokens) {
            total += [token intValue];
        }
    return total;
}

- (BOOL)containsWithinNumbers:(NSString *)numbers delimiter:(NSString *)delimiter {
    return [numbers rangeOfString:@","].location != NSNotFound;
}
@end