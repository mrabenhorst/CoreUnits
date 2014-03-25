//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import "CUArealValue.h"
#import "CUArealUnit.h"


@implementation CUArealValue

- (id)initWithArealUnit:(CUArealUnit*) arealUnit andValue:(double) value {
	if( self = [super init] ) {
		_unit = [arealUnit retain];
		_value = value;
	}
	return self;
}

- (CUArealValue*)valueByConvertingToUnitType:(CUArealUnitType) newArealUnitType {
    return [self valueByConvertingToUnit:[CUArealUnit arealUnitWithType:newArealUnitType]];
}

- (CUArealValue*)valueByConvertingToUnit:(CUArealUnit*) newArealUnit {

	double convertedValue;

	// First, convert forward from current unit to meters or newArealUnit if that comes before the base meters unit
	CUArealUnit *currentForwardUnit = (CUArealUnit*)_unit;
	double currentForwardValue = _value;
	while( [currentForwardUnit unitType] != CULinearUnitTypeMeter && [currentForwardUnit unitType] != [newArealUnit unitType] ) {
		currentForwardValue *= [currentForwardUnit baseUnitMultiplier];
		currentForwardUnit = [CUArealUnit arealUnitWithType:[currentForwardUnit baseUnitType]];
	}

	// Test whether a backward unit conversion is needed
	if( [currentForwardUnit unitType] != [newArealUnit unitType] ) {
		// Second, convert backward from newArealUnit to meters
		CUArealUnit *currentBackwardUnit = newArealUnit;
		double currentBackwardValue = 1;
		while( [currentBackwardUnit unitType] != CULinearUnitTypeMeter ) {
			currentBackwardValue *= [currentBackwardUnit baseUnitMultiplier];
			currentBackwardUnit = [CUArealUnit arealUnitWithType:[currentBackwardUnit baseUnitType]];
		}
		// Finally, division of the forward value by the backward conversion value yields value of the new type
		convertedValue = currentForwardValue / currentBackwardValue;
	} else {
		// If not, we have arrived at the unit and the converted value is the forward converted value
		convertedValue = currentForwardValue;
	}

	// Return the newly created and autoreleased value
	return [[[CUArealValue alloc] initWithArealUnit:newArealUnit andValue:convertedValue] autorelease];

}



- (void)dealloc {
	[_unit release];
	[super dealloc];
}

@end