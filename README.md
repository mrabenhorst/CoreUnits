CoreUnits
=========

A unit conversion library for Objective-C to keep track of and easily convert between units of measurement. In the near future, CoreUnits will allow a user to dynamically create any unit to convert to-from by providing an established base unit conversion. 

CoreUnits is based off of the SI system and all base units are the currently recognized base units of the SI system. Imperial base units are those with agreed upon exact conversions to an SI base unit. All Imperial units are converted down to the base Imperial unit and then converted to SI to retain precision.

## Sample Usage

### Declaring a CUValue
```
CULinearValue *linearValue = [[CULinearValue alloc] initWithLinearUnitType:CULinearUnitTypeKilometer andValue:1];
```
### Converting from one unit to another

```
CULinearValue *linearValueInYards = [linearValue valueByConvertingToUnitType:CULinearUnitTypeYard];
// Note that valueByConvertingToUnit: returns an autoreleased object
```

### Printing out values
```
NSLog(@"%@",linearValueInYards); // 1093.613298 Yards
NSLog(@"%.2f %@",[linearValueInYards value], [[linearValueInYards unit] unitAbbreviation] ); // 1093.61 yd
```


# Current Units List:
CoreUnits allows conversion between any 2 units of the same mechanic or dimension.


## Linear Units:
1. Meter - CU's base linear unit
2. Kilometer
3. Feet
4. Yard - CU's base linear Imperial Unit
5. Mile

## Areal Units:
1. Square Meter - CU's base areal unit
2. Square Kilometer
3. Hectare
4. Square Foot
5. Square Yard - CU's base areal Imperial Unit
6. Square Mile
7. Acre

## Volumetric Units:
Coming soon

## Temporal Units:
Coming soon

## Temperature Units
Coming soon

# Unit system tracking and adaptive conversions
CoreUnits provides a class called ```CUUnitTracker``` which accepts ```CUValue```s of any unit system and returns them according to the ```CUUnitTrackerDefault``` scheme applied to the tracker.