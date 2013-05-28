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

    numbers = [self handleContainsWithin:numbers delimiter:@"\n"];

    if (YES == [self containsWithin:numbers delimiter:@"," ]) return [self sum:numbers];

    return [numbers length] > 0 ? [numbers intValue] : 0;

}

- (NSString *)handleContainsWithin:(NSString *)numbers delimiter:(NSString *)delimiter {
    return [numbers stringByReplacingOccurrencesOfString:delimiter withString:@","];
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