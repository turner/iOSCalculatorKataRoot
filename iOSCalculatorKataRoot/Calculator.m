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

    // turn all delimiters into commas
    numbers = [self handleCustomDelimiterContainedWithinNumbers:numbers];

    [self guardCondition_RejectDuplicateDelimitersWithinNumbers:numbers];

    if (YES == [self containsWithin:numbers delimiter:@"," ]) return [self sum:numbers];

    return [numbers length] > 0 ? [numbers intValue] : 0;

}

- (void)guardCondition_RejectDuplicateDelimitersWithinNumbers:(NSString *)numbers {

    if (YES == [self containsWithin:numbers delimiter:@",,"]) [NSException raise:@"DuplicateDelimiterException" format:@""];
}

- (NSString *)handleCustomDelimiterContainedWithinNumbers:(NSString *)numbers {

    if (YES == [numbers hasPrefix:@"//"]) {
        NSString *prefix = [numbers substringWithRange:NSMakeRange(0, 4)];
        NSString *delimiter = [prefix substringWithRange:NSMakeRange(2, 1)];

        NSString *suffix = [numbers substringWithRange:NSMakeRange([prefix length], [numbers length] - [prefix length])];

        NSLog(@"prefix %@. delimiter %@. suffix %@", prefix, delimiter, suffix);

        return [suffix stringByReplacingOccurrencesOfString:delimiter withString:@","];
    }

    return [numbers stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (BOOL)containsWithin:(NSString *)numbers delimiter:(NSString *)delimiter {
    return [numbers rangeOfString:delimiter].location != NSNotFound;
}

- (int)sum:(NSString *)numbers {

    NSArray *tokens = [numbers componentsSeparatedByString:@","];

    int total = 0;
    for (NSString *number in tokens) {
        total += [number intValue];
    }
    return total;
}
@end