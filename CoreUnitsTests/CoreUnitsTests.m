//
//  CoreUnitsTests.m
//  CoreUnitsTests
//
//  Created by Mark Rabenhorst on 3/17/14.
//  Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CULinearValue.h"
#import "CULinearUnit.h"
#import "CUUnitTracker.h"

@interface CoreUnitsTests : XCTestCase

@end

@implementation CoreUnitsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    CULinearValue *linearValue = [[CULinearValue alloc] initWithLinearUnitType:CULinearUnitTypeKilometer andValue:1];
    CULinearValue *linearValueInYards = [linearValue valueByConvertingToUnitType:CULinearUnitTypeYard];
    
    CULinearUnit *floorUnit = [[CULinearUnit alloc] initLinearUnitWithType:CULinearUnitTypeCustom nameSingular:@"Floor" namePlural:@"Floors" abbreviation:@"flrs" baseUnitType:CULinearUnitTypeFoot unitConversionBlock:^(double value){return value*8;}];
    CULinearValue *searsTower = [[CULinearValue alloc] initWithLinearUnit:floorUnit andValue:108];
    NSLog(@"Sears tower is %@ high", searsTower);
    NSLog(@"Sears tower is %@ high", [searsTower valueByConvertingToUnitType:CULinearUnitTypeFoot]);
    NSLog(@"Sears tower is %@ high", [searsTower valueByConvertingToUnitType:CULinearUnitTypeMeter]);
    
    CULinearUnit *pencilUnit = [[CULinearUnit alloc] initLinearUnitWithType:CULinearUnitTypeCustom nameSingular:@"Pencil" namePlural:@"Pencils" abbreviation:@"pncl" baseUnitType:CULinearUnitTypeFoot unitConversionBlock:^(double value){return value*0.583333;}];
    
    NSLog(@"Sears tower is %@ high", [searsTower valueByConvertingToUnit:pencilUnit]);
    
    NSLog(@"%@",linearValueInYards);
    NSLog(@"%.2f %@",[linearValueInYards value], [[linearValueInYards unit] unitAbbreviation] );
    
    CUUnitTracker *unitTracker = [[CUUnitTracker alloc] initWithUnitTrackerDefault:CUUnitTrackerDefaultCommonScaleAdaptiveSI];
    NSLog(@"%@",[unitTracker valueFromValue:linearValue]);
    [unitTracker setUnitTrackerDefault:CUUnitTrackerDefaultCommonScaleAdaptiveImperial];
    NSLog(@"%@",[unitTracker valueFromValue:linearValue]);
}

@end
