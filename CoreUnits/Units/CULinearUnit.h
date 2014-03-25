//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CUUnitTypes.h"
#import "CUUnit.h"

@interface CULinearUnit : CUUnit {
	CULinearUnitType _unitType;
	CULinearUnitType _baseUnitType;
}

@property (nonatomic, readonly) CULinearUnitType unitType;
@property (nonatomic, readonly) CULinearUnitType baseUnitType;

- (id)initLinearUnitWithType:(CULinearUnitType) unitType
                nameSingular:(NSString*) unitNameSingular
                  namePlural:(NSString*) unitNamePlural
			    abbreviation:(NSString*) unitAbbreviation
				baseUnitType:(CULinearUnitType) baseUnitType
			  unitConversionBlock:(CUUnitConversionBlock) unitConversionBlock;

+ (id)linearUnitWithType:(CULinearUnitType) linearUnitType;

+ (id)meters;
+ (id)kilometers;
+ (id)feet;
+ (id)miles;

@end