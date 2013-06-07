//
// Created by Douglass Turner on 6/7/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol IScientificCalculator <NSObject>

@required
- (double)sin:(double)input;
- (double)cos:(double)input;
- (double)sqrt:(double)input;
@end