//
// Created by Douglass Turner on 5/27/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Calculator.h"


@implementation Calculator {

}
- (int)add:(NSString *)numbers {

    return [numbers length] > 0 ? [numbers intValue] : 0;
}
@end