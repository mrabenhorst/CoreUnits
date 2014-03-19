//
//  CUValue.m
//  CoreUnits
//
//  Created by Mark Rabenhorst on 3/17/14.
//  Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import "CUValue.h"
#import "CUUnit.h"

@implementation CUValue

@synthesize value = _value;
@synthesize unit = _unit;

- (NSString*)description {
	return [NSString stringWithFormat:@"%f %@", _value, (_value != 1 ? [_unit unitNamePlural] : [_unit unitNameSingular] )];
}

@end
