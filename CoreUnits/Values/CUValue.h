//
//  CUValue.h
//  CoreUnits
//
//  Created by Mark Rabenhorst on 3/17/14.
//  Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CUUnit;

@interface CUValue : NSObject {
	double _value;
	CUUnit *_unit;
}

@property (nonatomic, assign) double value;
@property (nonatomic, readonly) CUUnit *unit;

@end
