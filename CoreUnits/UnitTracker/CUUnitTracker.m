//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import "CUUnitTracker.h"
#import "CULinearUnit.h"
#import "CUArealUnit.h"
#import "CULinearValue.h"

@implementation CUUnitTracker

@synthesize linearUnit = _linearUnit;
@synthesize arealUnit = _arealUnit;

- (id)init {
	if( self = [super init] ) {

	}
	return self;
}

- (id)initWithUnitTrackerDefault:(CUUnitTrackerDefault) unitTrackerDefault {
	if( self = [super init] ) {
		_unitTrackerDefault = unitTrackerDefault;
	}
	return self;
}

- (CULinearValue*)valueFromValue:(CULinearValue*) fromValue {
	if( !_unitTrackerDefault ) {
		return [fromValue valueByConvertingToUnit:_linearUnit];
	} else {
		return [CUUnitTracker linearValueFromValue:fromValue usingUnitTrackerDefault:_unitTrackerDefault];
	}
}

+ (CULinearValue*)linearValueFromValue:(CULinearValue*) linearValue usingUnitTrackerDefault:(CUUnitTrackerDefault) unitTrackerDefault {
	switch( unitTrackerDefault ) {
		case CUUnitTrackerDefaultCommonScaleAdaptiveSI: {
			// Take linear value down to meters
			CULinearValue *linearValueInMeters;
			if( [[linearValue unit] unitType] != CULinearUnitTypeMeter ) {
				linearValueInMeters = [linearValue valueByConvertingToUnit:[CULinearUnit meters]];
			} else {
				linearValueInMeters = linearValue;
			}

			// If meters value >=1000 then convert to kilometers, else keep as meters
			if( [linearValueInMeters value] >= 1000 ) {
				return [linearValueInMeters valueByConvertingToUnit:[CULinearUnit kilometers]];
			} else {
				return linearValueInMeters;
			}
		}

		case CUUnitTrackerDefaultCommonScaleAdaptiveImperial: {
			// Take linear value down to feet
			CULinearValue *linearValueInFeet;
			if( [[linearValue unit] unitType] != CULinearUnitTypeFoot ) {
				linearValueInFeet = [linearValue valueByConvertingToUnit:[CULinearUnit feet]];
			} else {
				linearValueInFeet = linearValue;
			}

			// If feet value >=5280 then convert to miles, else keep as feet
			if( [linearValueInFeet value] >= 5280 ) {
				return [linearValueInFeet valueByConvertingToUnit:[CULinearUnit miles]];
			} else {
				return linearValueInFeet;
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
