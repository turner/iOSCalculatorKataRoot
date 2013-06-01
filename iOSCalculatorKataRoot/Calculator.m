//
// Created by Douglass Turner on 6/1/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Calculator.h"


@implementation Calculator {

}
- (int)add:(NSString *)numbers {

    numbers = [self handleCustomDelimitersWithinNumbers:numbers];

    numbers = [self handleNewlineDelimitersWithinNumbers:numbers];

    [self guardCondition_RejectDuplicateDelimitersWithinNumbers:numbers];

    if ([self containsWIthinNumbers:numbers delimiter:@"," ]) {
        return [self sumNumbers:numbers];

    }

    return [numbers length] > 0 ? [numbers intValue] : 0;
}

- (NSString *)handleCustomDelimitersWithinNumbers:(NSString *)numbers {
    if ([self containsWIthinNumbers:numbers delimiter:@"//"]) {
        NSString *delimiter = [numbers substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbers substringWithRange:NSMakeRange(4, [numbers length] - 4)];
        numbers = [suffix stringByReplacingOccurrencesOfString:delimiter withString:@","];
    }
    return numbers;
}

- (void)guardCondition_RejectDuplicateDelimitersWithinNumbers:(NSString *)numbers {

    if ([numbers rangeOfString:@",,"].location != NSNotFound) {
        [NSException raise:@"DuplicateDelimiterException" format:@""];
    }

}

- (NSString *)handleNewlineDelimitersWithinNumbers:(NSString *)numbers {
    return [numbers stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (BOOL)containsWIthinNumbers:(NSString *)numbers delimiter:(NSString *)delimiter {
    return [numbers rangeOfString:delimiter].location != NSNotFound;
}

- (int)sumNumbers:(NSString *)numbers {
    NSArray *tokens = [numbers componentsSeparatedByString:@","];
    int total = 0;
    for (NSString *token in tokens) {
            total += [token intValue];
        }

    return total;
}
@end