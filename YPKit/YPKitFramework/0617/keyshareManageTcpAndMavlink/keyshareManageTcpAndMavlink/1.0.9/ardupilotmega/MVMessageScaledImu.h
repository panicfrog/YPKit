//
//  MVMessageScaledImu.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SCALED_IMU Mavlink message.

 @discussion The RAW IMU readings for the usual 9DOF sensor setup. This message should contain the scaled values to the described units
 */
@interface MVMessageScaledImu : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs xacc:(int16_t)xacc yacc:(int16_t)yacc zacc:(int16_t)zacc xgyro:(int16_t)xgyro ygyro:(int16_t)ygyro zgyro:(int16_t)zgyro xmag:(int16_t)xmag ymag:(int16_t)ymag zmag:(int16_t)zmag;

//! Timestamp (milliseconds since system boot)
- (uint32_t)timeBootMs;

//! X acceleration (mg)
- (int16_t)xacc;

//! Y acceleration (mg)
- (int16_t)yacc;

//! Z acceleration (mg)
- (int16_t)zacc;

//! Angular speed around X axis (millirad /sec)
- (int16_t)xgyro;

//! Angular speed around Y axis (millirad /sec)
- (int16_t)ygyro;

//! Angular speed around Z axis (millirad /sec)
- (int16_t)zgyro;

//! X Magnetic field (milli tesla)
- (int16_t)xmag;

//! Y Magnetic field (milli tesla)
- (int16_t)ymag;

//! Z Magnetic field (milli tesla)
- (int16_t)zmag;

@end
