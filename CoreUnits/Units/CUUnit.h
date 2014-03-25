//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CUUnitTypes.h"

@class CUUnit;
typedef double(^CUUnitConversionBlock)(double); // Input: Current value, Output: value converted to base units

@interface CUUnit : NSObject {
	CUUnitMechanic _unitMechanic;
    
    CUUnitConversionBlock _unitConversionBlock;

	NSString *_unitNameSingular;
	NSString *_unitNamePlural;
	NSString *_unitAbbreviation;
}

@property (nonatomic, copy) CUUnitConversionBlock unitConversionBlock;
@property (nonatomic, readonly) CUUnitMechanic unitMechanic;

@property (nonatomic, readonly) NSString *unitNameSingular;
@property (nonatomic, readonly) NSString *unitNamePlural;
@property (nonatomic, readonly) NSString *unitAbbreviation;

@end