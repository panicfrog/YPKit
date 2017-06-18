//
//  MVMessageRawPressure.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a RAW_PRESSURE Mavlink message.

 @discussion The RAW pressure readings for the typical setup of one absolute pressure and one differential pressure sensor. The sensor values should be the raw, UNSCALED ADC values.
 */
@interface MVMessageRawPressure : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec pressAbs:(int16_t)pressAbs pressDiff1:(int16_t)pressDiff1 pressDiff2:(int16_t)pressDiff2 temperature:(int16_t)temperature;

//! Timestamp (microseconds since UNIX epoch or microseconds since system boot)
- (uint64_t)timeUsec;

//! Absolute pressure (raw)
- (int16_t)pressAbs;

//! Differential pressure 1 (raw)
- (int16_t)pressDiff1;

//! Differential pressure 2 (raw)
- (int16_t)pressDiff2;

//! Raw Temperature measurement (raw)
- (int16_t)temperature;

@end
