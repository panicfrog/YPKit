//
//  MVMessageScaledPressure.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SCALED_PRESSURE Mavlink message.

 @discussion The pressure readings for the typical setup of one absolute and differential pressure sensor. The units are as specified in each field.
 */
@interface MVMessageScaledPressure : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs pressAbs:(float)pressAbs pressDiff:(float)pressDiff temperature:(int16_t)temperature;

//! Timestamp (microseconds since UNIX epoch or microseconds since system boot)
- (uint32_t)timeBootMs;

//! Absolute pressure (hectopascal)
- (float)pressAbs;

//! Differential pressure 1 (hectopascal)
- (float)pressDiff;

//! Temperature measurement (0.01 degrees celsius)
- (int16_t)temperature;

@end
