//
// Created by Douglass Turner on 6/7/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Calculator.h"


@implementation Calculator {

}
- (int)add:(NSString *)numbers {

    if ([numbers rangeOfString:@","].location != NSNotFound) {
        NSArray *tokens = [numbers componentsSeparatedByString:@","];
        int total = 0;
        for (NSString *token in tokens) {
            total += [token intValue];
        }
        return total;
    }
    return [numbers length] > 0 ? [numbers intValue] : 0;
}
@end