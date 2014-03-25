//
//  CULinearValue.h
//  CoreUnits
//
//  Created by Mark Rabenhorst on 3/17/14.
//  Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CUValue.h"
#import "CUUnitTypes.h"

@class CULinearUnit;

@interface CULinearValue: CUValue {

}

- (id)initWithLinearUnitType:(CULinearUnitType) linearUnitType andValue:(double) value;
- (id)initWithLinearUnit:(CULinearUnit*) linearUnit andValue:(double) value;

- (CULinearValue*)valueByConvertingToUnitType:(CULinearUnitType) newLinearUnitType;
- (CULinearValue*)valueByConvertingToUnit:(CULinearUnit*) newLinearUnit;

@end
