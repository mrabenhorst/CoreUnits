//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import "CUUnit.h"


@implementation CUUnit

@synthesize unitMechanic = _unitMechanic;
@synthesize unitNameSingular = _unitNameSingular;
@synthesize unitNamePlural = _unitNamePlural;
@synthesize unitAbbreviation = _unitAbbreviation;
@synthesize unitConversionBlock = _unitConversionBlock;

- (void)dealloc {
	[_unitConversionBlock release];
	[super dealloc];
}
@end