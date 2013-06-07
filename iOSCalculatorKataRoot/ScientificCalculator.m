//
// Created by Douglass Turner on 6/7/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "ScientificCalculator.h"

@implementation ScientificCalculator {

}

- (double)squared:(double)input {
    return input * input;
}

- (double)pow:(double)input power:(double)power {
    return pow(input, power);
}

- (double)sqrt:(double)input {
    return sqrt(input);
}

@end