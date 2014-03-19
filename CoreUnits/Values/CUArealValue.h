//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CUValue.h"

@class CUArealUnit;


@interface CUArealValue : CUValue {

}

- (id)initWithArealUnit:(CUArealUnit*) arealUnit andValue:(double) value;
- (CUArealValue*)valueByConvertingToUnit:(CUArealUnit*) newArealUnit;

@end