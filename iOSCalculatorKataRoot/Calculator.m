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

    return [numbers length] > 0 ? [numbers intValue] : 0;

}

@end