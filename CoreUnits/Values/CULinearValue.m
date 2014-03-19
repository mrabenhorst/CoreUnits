//
//  CULinearValue.m
//  CoreUnits
//
//  Created by Mark Rabenhorst on 3/17/14.
//  Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import "CULinearValue.h"
#import "CULinearUnit.h"

@implementation CULinearValue

- (id)initWithLinearUnit:(CULinearUnit*) linearUnit andValue:(double) value {
	if( self = [super init] ) {
		_unit = [linearUnit retain];
		_value = value;
	}
	return self;
}

- (CULinearValue*)valueByConvertingToUnit:(CULinearUnit*) newLinearUnit {

	double convertedValue;

	// First, convert forward from current unit to meters or newLinearUnit if that comes before the base meters unit
	CULinearUnit * currentForwardUnit = (CULinearUnit*)_unit;
	double currentForwardValue = _value;
	while( [currentForwardUnit unitType] != CULinearUnitTypeMeter && [currentForwardUnit unitType] != [newLinearUnit unitType] ) {
		currentForwardValue *= [currentForwardUnit baseUnitMultiplier];
		currentForwardUnit = [CULinearUnit linearUnitWithType:[currentForwardUnit baseUnitType]];
	}

	// Test whether a backward unit conversion is needed
	if( [currentForwardUnit unitType] != [newLinearUnit unitType] ) {
		// Second, convert backward from newLinearUnit to meters
		CULinearUnit *currentBackwardUnit = newLinearUnit;
		double currentBackwardValue = 1;
		while( [currentBackwardUnit unitType] != CULinearUnitTypeMeter ) {
			currentBackwardValue *= [currentBackwardUnit baseUnitMultiplier];
			currentBackwardUnit = [CULinearUnit linearUnitWithType:[currentBackwardUnit baseUnitType]];
		}
		// Finally, division of the forward value by the backward conversion value yields value of the new type
		convertedValue = currentForwardValue / currentBackwardValue;
	} else {
		// If not, we have arrived at the unit and the converted value is the forward converted value
		convertedValue = currentForwardValue;
	}

	// Return the newly created and autoreleased value
	return [[[CULinearValue alloc] initWithLinearUnit:newLinearUnit andValue:convertedValue] autorelease];

}

- (void)dealloc {
	[_unit release];
	[super dealloc];
}


@end
