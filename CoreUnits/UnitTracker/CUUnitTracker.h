//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CULinearUnit;
@class CUArealUnit;
@class CULinearValue;

typedef enum {
	CUUnitTrackerDefaultCommonScaleAdaptiveSI, // Meters/Kilometers
	CUUnitTrackerDefaultCommonScaleAdaptiveImperial // Feet/Miles
} CUUnitTrackerDefault;

@interface CUUnitTracker : NSObject {
	CUUnitTrackerDefault _unitTrackerDefault;

	CULinearUnit *_linearUnit;
	CUArealUnit *_arealUnit;
}

- (id)init;
- (id)initWithUnitTrackerDefault:(CUUnitTrackerDefault) unitTrackerDefault;
- (CULinearValue*)valueFromValue:(CULinearValue*) fromValue;

+ (CULinearValue*)linearValueFromValue:(CULinearValue*) linearValue usingUnitTrackerDefault:(CUUnitTrackerDefault) unitTrackerDefault;

@property (nonatomic, retain) CULinearUnit *linearUnit;
@property (nonatomic, retain) CUArealUnit *arealUnit;

@end