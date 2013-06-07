//
// Created by Douglass Turner on 6/7/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "ScientificCalculator.h"

@implementation ScientificCalculator {

}

- (NSNumber *)squared:(NSNumber *)input {
    return [NSNumber numberWithDouble:[input doubleValue] * [input doubleValue]];
}

- (NSNumber *)pow:(NSNumber *)input power:(NSNumber *)power {
    return [NSNumber numberWithDouble:pow([input doubleValue], [power doubleValue])];
}

- (NSNumber *)sqrt:(NSNumber *)input {
    return [NSNumber numberWithDouble:sqrt([input doubleValue])];
}

@end