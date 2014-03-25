//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import "CULinearUnit.h"


@implementation CULinearUnit

@synthesize unitType = _unitType;
@synthesize baseUnitType = _baseUnitType;

- (id)initLinearUnitWithType:(CULinearUnitType) unitType
                nameSingular:(NSString*) unitNameSingular
			      namePlural:(NSString*) unitNamePlural
				abbreviation:(NSString*) unitAbbreviation
				baseUnitType:(CULinearUnitType) baseUnitType
			  baseMultiplier:(double) baseMultiplier {

	if( self = [super init] ) {
		_unitMechanic       = CUUnitMechanicLinear;
		_unitType           = unitType;
		_baseUnitType       = baseUnitType;
		_baseUnitMultiplier = baseMultiplier;
		_unitNameSingular   = [unitNameSingular copy];
		_unitNamePlural     = [unitNamePlural copy];
		_unitAbbreviation   = [unitAbbreviation copy];
	}
	return self;
}

+ (id)meters {
	return [[[CULinearUnit alloc] initLinearUnitWithType:CULinearUnitTypeMeter
	                                        nameSingular:@"Meter"
	                                          namePlural:@"Meters"
		                                    abbreviation:@"m"
					                        baseUnitType:CULinearUnitTypeMeter
								          baseMultiplier:1.0] autorelease];
}

+ (id)kilometers {
	return [[[CULinearUnit alloc] initLinearUnitWithType:CULinearUnitTypeKilometer
	                                        nameSingular:@"Kilometer"
				                              namePlural:@"Kilometers"
		                                    abbreviation:@"Km"
					                        baseUnitType:CULinearUnitTypeMeter
								          baseMultiplier:1000.0] autorelease];
}

+ (id)feet {
	return [[[CULinearUnit alloc] initLinearUnitWithType:CULinearUnitTypeFoot
	                                        nameSingular:@"Foot"
				                              namePlural:@"Feet"
		                                    abbreviation:@"ft"
					                        baseUnitType:CULinearUnitTypeYard
								          baseMultiplier:(1.0/3.0)] autorelease];
}

+ (id)yards {
	return [[[CULinearUnit alloc] initLinearUnitWithType:CULinearUnitTypeYard
	                                        nameSingular:@"Yard"
				                              namePlural:@"Yards"
						                    abbreviation:@"yd"
									        baseUnitType:CULinearUnitTypeMeter
										  baseMultiplier:0.9144] autorelease]; // As established by the International yard and pound agreement of 1959
}

+ (id)miles {
	return [[[CULinearUnit alloc] initLinearUnitWithType:CULinearUnitTypeMile
	                                        nameSingular:@"Mile"
				                              namePlural:@"Miles"
						                    abbreviation:@"Mi"
									        baseUnitType:CULinearUnitTypeFoot
										  baseMultiplier:5280.0] autorelease];
}

+ (id)linearUnitWithType:(CULinearUnitType) linearUnitType {
	switch ( linearUnitType ) {

		case CULinearUnitTypeMeter:
			return [CULinearUnit meters];

		case CULinearUnitTypeKilometer:
			return [CULinearUnit kilometers];

		case CULinearUnitTypeFoot:
			return [CULinearUnit feet];
            
        case CULinearUnitTypeYard:
			return [CULinearUnit yards];

		case CULinearUnitTypeMile:
			return [CULinearUnit miles];

		default:
			break;
	}
	return nil;
}

- (void)dealloc {
	[_unitNameSingular release];
	[_unitNamePlural release];
	[_unitAbbreviation release];
	[super dealloc];
}

@end