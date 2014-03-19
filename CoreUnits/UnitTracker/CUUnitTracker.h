//
// Created by Mark Rabenhorst on 3/18/14.
// Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CULinearUnit;
@class CUArealUnit;
@class CULinearValue;
@class CUValue;

typedef enum {
    CUUnitTrackerDefaultNone,
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

- (CUValue*)valueFromValue:(CUValue*) fromValue;

+ (CULinearValue*)linearValueFromValue:(CULinearValue*) linearValue usingUnitTrackerDefault:(CUUnitTrackerDefault) unitTrackerDefault;

@property (nonatomic, retain) CULinearUnit *linearUnit;
@property (nonatomic, retain) CUArealUnit *arealUnit;
@property (nonatomic, assign) CUUnitTrackerDefault unitTrackerDefault;

@end