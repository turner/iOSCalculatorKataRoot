//
// Created by Douglass Turner on 6/7/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol IScientificCalculator <NSObject>

@required
-(NSNumber *)squared:(NSNumber *)input;
- (NSNumber *)pow:(NSNumber *)input power:(NSNumber *)power;
-(NSNumber *)sqrt:(NSNumber *)input;
@end