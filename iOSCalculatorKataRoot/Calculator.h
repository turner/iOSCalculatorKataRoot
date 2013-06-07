//
// Created by Douglass Turner on 6/7/13.
// Copyright (c) 2013 Elastic Image Software. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <Foundation/Foundation.h>

@protocol IScientificCalculator;

@interface Calculator : NSObject
@property(nonatomic, strong) id <IScientificCalculator> scientificCalculator;

- (id)initWithScientificCalculator:(id <IScientificCalculator>)scientificCalculator;
- (int)add:(NSString *)numbers;
@end