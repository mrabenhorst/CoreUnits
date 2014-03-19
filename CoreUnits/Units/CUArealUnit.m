//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import "CUArealUnit.h"


@implementation CUArealUnit

- (id)initArealUnitWithType:(CUArealUnitType) unitType
               nameSingular:(NSString*) unitNameSingular
			     namePlural:(NSString*) unitNamePlural
			   abbreviation:(NSString*) unitAbbreviation
			   baseUnitType:(CUArealUnitType) baseUnitType
			 baseMultiplier:(double) baseMultiplier {

	if( self = [super init] ) {
		_unitType           = unitType;
		_baseUnitType       = baseUnitType;
		_baseUnitMultiplier = baseMultiplier;
		_unitNameSingular   = [unitNameSingular copy];
		_unitNamePlural     = [unitNamePlural copy];
		_unitAbbreviation   = [unitAbbreviation copy];
	}
	return self;
}

+ (id)squareMeters {
	return [[[CUArealUnit alloc] initArealUnitWithType:CUArealUnitTypeSquareMeter
	                                      nameSingular:@"Square Meter"
				                            namePlural:@"Square Meters"
						                  abbreviation:@"sq m"
									      baseUnitType:CUArealUnitTypeSquareMeter
										baseMultiplier:1.0] autorelease];
}

+ (id)squareKilometers {
	return [[[CUArealUnit alloc] initArealUnitWithType:CUArealUnitTypeSquareKilometer
	                                      nameSingular:@"Square Kilometer"
				                            namePlural:@"Square Kilometers"
						                  abbreviation:@"sq Km"
									      baseUnitType:CUArealUnitTypeSquareMeter
										baseMultiplier:1000000.0] autorelease];
}

+ (id)hectares {
	return [[[CUArealUnit alloc] initArealUnitWithType:CUArealUnitTypeHectare
	                                      nameSingular:@"Hectare"
				                            namePlural:@"Hectares"
						                  abbreviation:@"ha"
									      baseUnitType:CUArealUnitTypeSquareMeter
										baseMultiplier:10000.0] autorelease];
}

+ (id)squareFeet {
	return [[[CUArealUnit alloc] initArealUnitWithType:CUArealUnitTypeSquareFoot
	                                      nameSingular:@"Square Foot"
				                            namePlural:@"Square Feet"
						                  abbreviation:@"sq ft"
									      baseUnitType:CUArealUnitTypeSquareYard
										baseMultiplier:(1.0/9.0)] autorelease];
}

+ (id)squareYards {
	return [[[CUArealUnit alloc] initArealUnitWithType:CUArealUnitTypeSquareYard
	                                      nameSingular:@"Square Yard"
				                            namePlural:@"Square Yards"
						                  abbreviation:@"sq yd"
									      baseUnitType:CUArealUnitTypeSquareMeter
										baseMultiplier:0.83612736] autorelease]; // As derived by the linear yard->meter established by the International yard and pound agreement of 1959
}

+ (id)squareMiles {
	return [[[CUArealUnit alloc] initArealUnitWithType:CUArealUnitTypeSquareMile
	                                      nameSingular:@"Square Mile"
				                            namePlural:@"Square Miles"
						                  abbreviation:@"sq mi"
									      baseUnitType:CUArealUnitTypeSquareFoot
										baseMultiplier:(1.0/27878400.0)] autorelease];
}

+ (id)acres {
	return [[[CUArealUnit alloc] initArealUnitWithType:CUArealUnitTypeAcre
	                                      nameSingular:@"Acre"
				                            namePlural:@"Acres"
						                  abbreviation:@"ac"
									      baseUnitType:CUArealUnitTypeSquareYard
										baseMultiplier:4840.0] autorelease];
}

+ (id)arealUnitWithType:(CUArealUnitType) arealUnitType {
	switch ( arealUnitType ) {

		case CUArealUnitTypeSquareMeter:
			return [CUArealUnit squareMeters];

		case CUArealUnitTypeSquareKilometer:
			return [CUArealUnit squareKilometers];

		case CUArealUnitTypeHectare:
			return [CUArealUnit hectares];

		case CUArealUnitTypeSquareFoot:
			return [CUArealUnit squareFeet];

		case CUArealUnitTypeSquareYard:
			return [CUArealUnit squareYards];

		case CUArealUnitTypeSquareMile:
			return [CUArealUnit squareMiles];

		case CUArealUnitTypeAcre:
			return [CUArealUnit acres];

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