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
    
    CULinearValue *linearValue = [[CULinearValue alloc] initWithLinearUnit:[CULinearUnit miles] andValue:1];
    
    CUUnitTracker *unitTracker = [[CUUnitTracker alloc] initWithUnitTrackerDefault:CUUnitTrackerDefaultCommonScaleAdaptiveSI];
    NSLog(@"%@",[unitTracker valueFromValue:linearValue]);
    [unitTracker setUnitTrackerDefault:CUUnitTrackerDefaultCommonScaleAdaptiveImperial];
    NSLog(@"%@",[unitTracker valueFromValue:linearValue]);
}

@end
