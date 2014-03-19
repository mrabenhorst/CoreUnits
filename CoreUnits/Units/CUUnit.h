//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CUUnitTypes.h"

@interface CUUnit : NSObject {
	CUUnitMechanic _unitMechanic;
	double _baseUnitMultiplier;

	NSString *_unitNameSingular;
	NSString *_unitNamePlural;
	NSString *_unitAbbreviation;
}

@property (nonatomic, readonly) double baseUnitMultiplier;
@property (nonatomic, readonly) CUUnitMechanic unitMechanic;

@property (nonatomic, readonly) NSString *unitNameSingular;
@property (nonatomic, readonly) NSString *unitNamePlural;
@property (nonatomic, readonly) NSString *unitAbbreviation;

@end