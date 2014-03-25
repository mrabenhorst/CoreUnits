//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CUValue.h"
#import "CUUnitTypes.h"

@class CUArealUnit;


@interface CUArealValue : CUValue {

}

- (id)initWithArealUnitType:(CUArealUnitType) arealUnitType andValue:(double) value;
- (id)initWithArealUnit:(CUArealUnit*) arealUnit andValue:(double) value;

- (CUArealValue*)valueByConvertingToUnitType:(CUArealUnitType) newArealUnitType;

@end