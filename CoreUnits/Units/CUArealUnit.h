//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CUUnitTypes.h"
#import "CUUnit.h"


@interface CUArealUnit : CUUnit {
	CUArealUnitType _unitType;
	CUArealUnitType _baseUnitType;
}

@property (nonatomic, readonly) CUArealUnitType unitType;
@property (nonatomic, readonly) CUArealUnitType baseUnitType;

- (id)initArealUnitWithType:(CUArealUnitType) unitType
                nameSingular:(NSString*) unitNameSingular
			      namePlural:(NSString*) unitNamePlural
				abbreviation:(NSString*) unitAbbreviation
				baseUnitType:(CUArealUnitType) baseUnitType
		 unitConversionBlock:(CUUnitConversionBlock) unitConversionBlock;

+ (id)arealUnitWithType:(CUArealUnitType) arealUnitType;

+ (id)squareMeters;
+ (id)squareKilometers;
+ (id)hectares;
+ (id)squareFeet;
+ (id)squareYards;
+ (id)squareMiles;
+ (id)acres;

@end