//
// Created by Douglass Turner on 5/25/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Calculator.h"


@implementation Calculator {

}

- (int)add:(NSString *)numbers {

    return ([numbers length] > 0) ? [self sum:numbers] : 0;

}

- (int)sum:(NSString *)numbers {

    NSString *delimiter = @",";
    if ([numbers rangeOfString:delimiter].location != NSNotFound) {
        
        NSArray *tokens = [numbers componentsSeparatedByString:delimiter];

        int total = 0;
        for (NSString *token in tokens) {
            total += [token intValue];
        }

        return total;

    }

    return [numbers intValue];
}
@end