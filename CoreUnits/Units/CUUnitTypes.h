//
//  CUUnitTypes.h
//  CoreUnits
//
//  Created by Mark Rabenhorst on 3/17/14.
//  Copyright (c) 2014 Mark Rabenhorst. All rights reserved.
//


// Dimensional Measurements
typedef enum {
	CUUnitMechanicLinear,
    CUUnitMechanicAreal,
    CUUnitMechanicVolumetric
} CUUnitMechanic;

////////////////////
//
// Linear Units
//
////////////////////
typedef enum {
    // SI Units
    CULinearUnitTypeMeter, // Official base unit for linear units
    CULinearUnitTypeKilometer,
    
    // Imperial
    CULinearUnitTypeFoot,
	CULinearUnitTypeYard, // Base unit for Imperial linear units
    CULinearUnitTypeMile
    
} CULinearUnitType;


////////////////////
//
// Areal Units
//
////////////////////
typedef enum {
	// SI Units
	CUArealUnitTypeSquareMeter, // Official base unit for areal units
	CUArealUnitTypeSquareKilometer,
	CUArealUnitTypeHectare,

	// Imperial
	CUArealUnitTypeSquareFoot,
	CUArealUnitTypeSquareYard, // Base unit for Imperial areal units
	CUArealUnitTypeSquareMile,
	CUArealUnitTypeAcre

} CUArealUnitType;
