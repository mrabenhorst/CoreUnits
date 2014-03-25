//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import "CUUnitTracker.h"
#import "CULinearUnit.h"
#import "CUArealUnit.h"
#import "CULinearValue.h"
#import "CUValue.h"
#import "CUArealValue.h"

@implementation CUUnitTracker

@synthesize linearUnit = _linearUnit;
@synthesize arealUnit = _arealUnit;
@synthesize unitTrackerDefault = _unitTrackerDefault;

- (id)init {
	if( self = [super init] ) {
        _unitTrackerDefault = CUUnitTrackerDefaultNone;
	}
	return self;
}

- (id)initWithUnitTrackerDefault:(CUUnitTrackerDefault) unitTrackerDefault {
	if( self = [super init] ) {
		_unitTrackerDefault = unitTrackerDefault;
	}
	return self;
}

- (CUValue*)valueFromValue:(CUValue*) fromValue {
	if( _unitTrackerDefault == CUUnitTrackerDefaultNone ) {
		switch( [[fromValue unit] unitMechanic] ) {
			case CUUnitMechanicLinear:
				return [(CULinearValue*)fromValue valueByConvertingToUnitType:[_linearUnit unitType]];

			case CUUnitMechanicAreal:
				return [(CUArealValue*)fromValue valueByConvertingToUnitType:[_arealUnit unitType]];

			case CUUnitMechanicVolumetric:
				break;

			default:
				break;
		}
	} else {
		switch( [[fromValue unit] unitMechanic] ) {
			case CUUnitMechanicLinear:
				return [CUUnitTracker linearValueFromValue:(CULinearValue*)fromValue usingUnitTrackerDefault:_unitTrackerDefault];

			case CUUnitMechanicAreal:
				return [CUUnitTracker arealValueFromValue:(CUArealValue*) fromValue usingUnitTrackerDefault:_unitTrackerDefault];

			case CUUnitMechanicVolumetric:
				break;

			default:
				break;
		}
	}
	return nil;
}

+ (CULinearValue*)linearValueFromValue:(CULinearValue*) linearValue usingUnitTrackerDefault:(CUUnitTrackerDefault) unitTrackerDefault {
	switch( unitTrackerDefault ) {
		case CUUnitTrackerDefaultCommonScaleAdaptiveSI: {
			// Take linear value down to meters
			CULinearValue *linearValueInMeters;
			if( [(CULinearUnit*)[linearValue unit] unitType] != CULinearUnitTypeMeter ) {
				linearValueInMeters = [linearValue valueByConvertingToUnitType:CULinearUnitTypeMeter];
			} else {
				linearValueInMeters = linearValue;
			}

			// If meters value >=1000 then convert to kilometers, else keep as meters
			if( [linearValueInMeters value] >= 1000 ) {
				return [linearValueInMeters valueByConvertingToUnitType:CULinearUnitTypeKilometer];
			} else {
				return linearValueInMeters;
			}
		}

		case CUUnitTrackerDefaultCommonScaleAdaptiveImperial: {
			// Take linear value down to feet
			CULinearValue *linearValueInFeet;
			if( [(CULinearUnit*)[linearValue unit] unitType] != CULinearUnitTypeFoot ) {
				linearValueInFeet = [linearValue valueByConvertingToUnitType:CULinearUnitTypeFoot];
			} else {
				linearValueInFeet = linearValue;
			}

			// If feet value >=5280 then convert to miles, else keep as feet
			if( [linearValueInFeet value] >= 5280 ) {
				return [linearValueInFeet valueByConvertingToUnitType:CULinearUnitTypeMile];
			} else {
				return linearValueInFeet;
			}
		}

		default:
			break;
	}
	return nil;
}

+ (CUArealValue*)arealValueFromValue:(CUArealValue*) arealValue usingUnitTrackerDefault:(CUUnitTrackerDefault) unitTrackerDefault {
	switch( unitTrackerDefault ) {
		case CUUnitTrackerDefaultCommonScaleAdaptiveSI: {
			// Take linear value down to meters
			CUArealValue *arealValueInSquareMeters;
			if( [(CUArealUnit*)[arealValue unit] unitType] != CUArealUnitTypeSquareMeter ) {
				arealValueInSquareMeters = [arealValue valueByConvertingToUnitType:CUArealUnitTypeSquareMeter];
			} else {
				arealValueInSquareMeters = arealValue;
			}

			// If meters value >=1000 then convert to kilometers, else keep as meters
			if( [arealValueInSquareMeters value] >= 1000000 ) {
				return [arealValueInSquareMeters valueByConvertingToUnitType:CUArealUnitTypeSquareKilometer];
			} else {
				return arealValueInSquareMeters;
			}
		}

		case CUUnitTrackerDefaultCommonScaleAdaptiveImperial: {
			// Take linear value down to feet
			CUArealValue *linearValueInSquareFeet;
			if( [(CUArealUnit*)[arealValue unit] unitType] != CUArealUnitTypeSquareFoot ) {
				linearValueInSquareFeet = [arealValue valueByConvertingToUnitType:CUArealUnitTypeSquareFoot];
			} else {
				linearValueInSquareFeet = arealValue;
			}

			// If feet value >=5280 then convert to miles, else keep as feet
			if( [linearValueInSquareFeet value] >= 27878400 ) {
				return [linearValueInSquareFeet valueByConvertingToUnitType:CUArealUnitTypeSquareMile];
			} else {
				return linearValueInSquareFeet;
			}
		}

		default:
			break;
	}

	return nil;
}

- (void)dealloc {
	[_linearUnit release];
	[_arealUnit release];
	[super dealloc];
}

@end
